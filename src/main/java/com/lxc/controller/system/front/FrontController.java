package com.lxc.controller.system.front;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.system.User;
import com.lxc.service.system.appuser.AppuserManager;
import com.lxc.service.system.menu.MenuManager;
import com.lxc.service.system.role.RoleManager;
import com.lxc.service.system.user.UserManager;
import com.lxc.util.*;
import com.lxc.util.mail.SimpleMailSender;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：FrontController
 * 创建人：lxc 1094921525qq
 * 更新时间：2018年01月3日
 * @version
 */
@Controller
@RequestMapping(value="/front")
public class FrontController extends BaseController {
	
	String menuUrl = "front/listUsers.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;

	/**
	 * 前端登录页面  应聘
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login")
	public ModelAndView toFrontLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/front/login");
		mv.addObject("msg","login");
		mv.addObject("pd",pd);
		return mv;
	}

    /**
     * 去重置密码
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/goResetPwd")
	public ModelAndView goResetPwd()throws  Exception{
		ModelAndView mv = this.getModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        //验证标识是否符合
        Session session = Jurisdiction.getSession();
        String resetPwd = (String)session.getAttribute(Const.RESETPWD);
        String flag = pd.getString(Const.RESETPWD);
        if(!resetPwd.equals(flag)){
         String   errInfo = "请求链接已经无效"; 				//用户名或密码有误
            logBefore(logger, "请求链接已经无效");
            mv.setViewName("save_result");
            mv.addObject("msg","failed");
            mv.addObject("errInfo",errInfo);
            mv.addObject("pd", pd);
        }else {
            pd = appuserService.findByUiId(pd);
            mv.setViewName("system/front/resetPwd");
            mv.addObject("msg", "resetPwd");
            mv.addObject("pd", pd);
        }

		return mv;
	}

    /**
     * 重置密码
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/resetPwd")
	public Object resetPwd() throws Exception {
        logBefore(logger, Jurisdiction.getUsername()+"重置密码");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
        String errInfo = "";
		Map<String,Object> map = new HashMap<String,Object>();
		//验证标识是否符合
        Session session = Jurisdiction.getSession();
        String resetPwd = (String)session.getAttribute(Const.RESETPWD);
        String flag = pd.getString(Const.RESETPWD);
        if(!resetPwd.equals(flag)){
            errInfo = "请求链接已经无效"; 				//用户名或密码有误
            logBefore(logger, "请求链接已经无效");
        }else {
            //重置密码
            PageData pdpwd = appuserService.findByEmail(pd);
            pdpwd.put("PASSWORD", new SimpleHash("SHA-1", pdpwd.getString("USERNAME"), "123456"));
            appuserService.editU(pdpwd);
            session.removeAttribute(Const.RESETPWD);
            errInfo ="success";
        }
        map.put("result", errInfo);
        return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 找回密码 发送短信
	 * @return
	 */
	@RequestMapping(value = "/find_pwd")
	@ResponseBody
	public Object findPwd()throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String msg = "ok";		//发送状态
		String strEMAIL = Tools.readTxtFile(Const.EMAIL);		//读取邮件配置
		List<PageData> pdList = new ArrayList<PageData>();
		String toEMAIL = pd.getString("EMAIL");			//对方邮箱
		String TITLE = toEMAIL + "找回密码";				    //标题
		String TYPE = "1";			                            //类型  1 纯文本  2 带标签
		String fmsg = "appuser";						        // 会员 "appuser"为会员用户
        Session session = Jurisdiction.getSession();
        String uuid = UuidUtil.get32UUID();
        if(null != strEMAIL && !"".equals(strEMAIL)){
			String strEM[] = strEMAIL.split(",lxc,");
			if(strEM.length == 4){
				try {
                    if(Tools.checkEmail(toEMAIL)){		//邮箱格式不对就跳过
                        PageData pdpwd= appuserService.findByEmail(pd);
                        String str = URLEncoder.encode("&", "ASCII") +Const.RESETPWD+"="+uuid;
                        System.out.println(str);
                        String CONTENT ="要重置密码,点击链接http://localhost:8080/front/goResetPwd.do?USER_ID="+pdpwd.get("USER_ID")+ str;//内容
                        session.setAttribute(Const.RESETPWD,uuid); //只能重置一次  标记
                        SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3], toEMAIL, TITLE, CONTENT, TYPE);          //调用发送邮件函数
					}
					msg = "ok";
				} catch (Exception e) {
					msg = "error";
				}
			}else{
				msg = "error";
			}
		}else{
			msg = "error";
		}
		pd.put("msg", msg);
		map.put("pd", pd);
		return AppUtil.returnObject(pd, map);
	}

	/**应聘者请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object front_login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").replaceAll("qq1094921525lxc", "").replaceAll("QQ1094921525lxc", "").split(",lxc,");
		if(null != KEYDATA && KEYDATA.length == 3){
			Session session = Jurisdiction.getSession();
			String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
			String code = KEYDATA[2];
			if(null == code || "".equals(code)){//判断效验码
				errInfo = "nullcode"; 			//效验码为空
			}else{
				String USERNAME = KEYDATA[0];	//登录过来的用户名
				String PASSWORD  = KEYDATA[1];	//登录过来的密码
				pd.put("USERNAME", USERNAME);
				if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){		//判断登录验证码
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);	//根据用户名和密码去读取用户信息
					if(pd != null){
						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						userService.updateLastLogin(pd);
						User user = new User();
						user.setUSER_ID(pd.getString("USER_ID"));
						user.setUSERNAME(pd.getString("USERNAME"));
						user.setPASSWORD(pd.getString("PASSWORD"));
						user.setNAME(pd.getString("NAME"));
						user.setRIGHTS(pd.getString("RIGHTS"));
						user.setROLE_ID(pd.getString("ROLE_ID"));
						user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
						user.setIP(pd.getString("IP"));
						user.setSTATUS(pd.getString("STATUS"));
						session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
						session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject();
						UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD);
						try {
							subject.login(token);
						} catch (AuthenticationException e) {
							errInfo = "身份验证失败！";
						}
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
						logBefore(logger, USERNAME+"登录系统密码或用户名错误");
					}
				}else{
					errInfo = "codeerror";				 	//验证码输入有误
				}
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";					//验证成功
					logBefore(logger, USERNAME+"登录系统");
				}
			}
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}


	/**
	 * 前端登录页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/front_register")
	public ModelAndView toFrontRegister()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/front/register");
		mv.addObject("pd",pd);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

}
