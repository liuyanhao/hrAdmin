package com.lxc.controller.system.front;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.system.Menu;
import com.lxc.entity.system.Role;
import com.lxc.entity.system.User;
import com.lxc.service.system.appuser.AppuserManager;
import com.lxc.service.system.buttonrights.ButtonrightsManager;
import com.lxc.service.system.lxcbutton.LxcbuttonManager;
import com.lxc.service.system.menu.MenuManager;
import com.lxc.service.system.role.RoleManager;
import com.lxc.service.system.user.UserManager;
import com.lxc.util.*;
import com.lxc.util.mail.SimpleMailSender;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

	private static final String NULL_CODE = "nullcode";
	private static final String CODE_ERROR = "codeerror";
	private static final String CODE_SUCCESS = "success";

	//菜单地址(权限用)
	String menuUrl = "front/listUsers.do";

	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name="lxcbuttonService")
	private LxcbuttonManager lxcbuttonService;
	@Resource(name="buttonrightsService")
	private ButtonrightsManager buttonrightsService;

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
		//读取系统名称
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
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
		String  USER_ID = "";
		String resetflage = "";
		String errInfo="";
		String flag = pd.getString("USER_ID");
		if(null != flag && !"".equals(flag)) {
			String strEM[] = flag.split(",lxc,");
			if (strEM.length == 2) {
				USER_ID = strEM[0];
				pd.put("USER_ID",USER_ID);
				resetflage = strEM[1];
				String resetPwd = (String) session.getAttribute(Const.RESETPWD);
				if(resetflage != null && resetPwd != null) {
					if (!resetPwd.equals(resetflage)) {
						//用户名或密码有误
						 errInfo = "请求链接已经无效";
						logBefore(logger, "请求链接已经无效");
						mv.setViewName("save_result");
						mv.addObject("errInfo", errInfo);
						mv.addObject("pd", pd);
					} else {
						pd = appuserService.findByUiId(pd);
						pd.put("UUID", resetflage);
						mv.setViewName("system/front/resetPwd");
						mv.addObject("msg", "resetPwd");
						mv.addObject("pd", pd);
					}
				}else{
					errInfo ="请求链接已经无效,参数不允许为空";
					logBefore(logger, "请求链接已经无效,参数不允许为空");
                    mv.setViewName("system/front/resetPwdMsg");
                    mv.addObject("errInfo", errInfo);
				}
			}
		}else{
			//用户名或密码有误
			errInfo = "请求链接已经无效";
			logBefore(logger, "请求链接已经无效");
            mv.setViewName("system/front/resetPwdMsg");
            mv.addObject("errInfo", errInfo);

		}
		return mv;
	}

    /**
     * 重置密码
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/resetPwd")
	public ModelAndView resetPwd() throws Exception {
		ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        logBefore(logger, pd.getString("EMAIL")+"重置密码");
        String errInfo = "";
		Map<String,Object> map = new HashMap<String,Object>();
		//验证标识是否符合
        Session session = Jurisdiction.getSession();
		String flag = pd.getString("UUID");
		String EMAIL = pd.getString("EMAIL");
		if(null != flag && !"".equals(flag)) {
				String resetPwd = (String)session.getAttribute(Const.RESETPWD);
			if(resetPwd != null && (EMAIL != null|| EMAIL !="" || EMAIL != "undefined") ) {
				if (!resetPwd.equals(flag)) {
					//用户名或密码有误
					errInfo = "请求链接已经无效,请在登录页面发送邮件重新申请。";
					logBefore(logger, errInfo);
				} else {
					//重置密码
					PageData pdpwd = appuserService.findByEmail(pd);
					pdpwd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
					appuserService.editU(pdpwd);
					//删除 session  中的 标识
					session.removeAttribute(Const.RESETPWD);
					errInfo = "密码重置成功！";
                    logBefore(logger, errInfo);
				}
			}else{
				errInfo ="请求链接已经无效";
				logBefore(logger, "请求链接已经无效");
			}
		}else{
				errInfo = "请求链接已经无效,请在登录页面发送邮件重新申请。";
			}
        mv.setViewName("system/front/resetPwdMsg");
        mv.addObject("errInfo", errInfo);
        return mv;
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
		String strEMAIL = Tools.readTxtFile(Const.EMAIL);
		//读取邮件配置
		List<PageData> pdList = new ArrayList<PageData>();
		//对方邮箱
		String toEMAIL = pd.getString("EMAIL");
		//标题
		String TITLE = toEMAIL + "找回密码";
		//类型  1 纯文本  2 带标签
		String TYPE = "1";
		// 会员 "appuser"为会员用户
		String fmsg = "appuser";
        Session session = Jurisdiction.getSession();
        String uuid = UuidUtil.get32UUID();
        if(null != strEMAIL && !"".equals(strEMAIL)){
			String strEM[] = strEMAIL.split(",lxc,");
			if(strEM.length == 4){
				try {
					//邮箱格式不对就跳过
                    if(Tools.checkEmail(toEMAIL)){
                        PageData pdpwd= appuserService.findByEmail(pd);
                        String str = ",lxc,"+ uuid;
                        System.out.println(str);
						//内容
                        String CONTENT ="hi  您好，我是熙财人力资源系统。"+pdpwd.getString("USERNAME")+" 账号要重置密码,点击链接http://hr.liuxicai.club/front/goResetPwd.do?USER_ID="+pdpwd.get("USER_ID")+ str;
						//只能重置一次  标记
                        session.setAttribute(Const.RESETPWD,uuid);
						//调用发送邮件函数
                        SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3], toEMAIL, TITLE, CONTENT, TYPE);
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

	/**访问系统首页
	 * @param changeMenu：切换菜单参数
	 * @return ModelAndView
	 */
	@RequestMapping(value="/main/{changeMenu}")
	@SuppressWarnings("unchecked")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			//读取session中的用户信息(单独用户信息)
			User user = (User)session.getAttribute(Const.SESSION_USER);
			if (user != null) {
				//读取session中的用户信息(含角色信息)
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);
				if(null == userr){
					//通过用户ID读取用户信息和角色信息
					user = appuserService.getUserAndRoleById(user.getUSER_ID());
					//存入session
					session.setAttribute(Const.SESSION_USERROL, user);
				}else{
					user = userr;
				}
				String USERNAME = user.getUSERNAME();
				String USER_ID = user.getUSER_ID();
				//获取用户角色
				Role role = user.getRole();
				//角色权限(菜单权限)
				String roleRights = role!=null ? role.getRIGHTS() : "";
				//将角色权限存入session
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights);
				//放入用户名到session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);
				//放入用户名ID到session
				session.setAttribute(Const.SESSION_USERID, USER_ID);
				List<Menu> allmenuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_allmenuList)){
					//获取所有菜单
					allmenuList = menuService.listAllMenuQx("0");
					if(Tools.notEmpty(roleRights)){
						//根据角色权限获取本权限的菜单列表
						allmenuList = this.readMenu(allmenuList, roleRights);
					}
					//菜单权限放入session中
					session.setAttribute(USERNAME + Const.SESSION_allmenuList, allmenuList);
				}else{
					allmenuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList);
				}
				//切换菜单处理=====start
				List<Menu> menuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_menuList) || ("yes".equals(changeMenu))){
					List<Menu> menuList1 = new ArrayList<Menu>();
					List<Menu> menuList2 = new ArrayList<Menu>();
					//拆分菜单
					for(int i=0;i<allmenuList.size();i++){
						Menu menu = allmenuList.get(i);
						if("1".equals(menu.getMENU_TYPE())){
							menuList1.add(menu);
						}else{
							menuList2.add(menu);
						}
					}
					session.removeAttribute(USERNAME + Const.SESSION_menuList);
					if("2".equals(session.getAttribute("changeMenu"))){
						session.setAttribute(USERNAME + Const.SESSION_menuList, menuList1);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "1");
						menuList = menuList1;
					}else{
						session.setAttribute(USERNAME + Const.SESSION_menuList, menuList2);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "2");
						menuList = menuList2;
					}
				}else{
					menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_menuList);
				}
				//切换菜单处理=====end
				if(null == session.getAttribute(USERNAME + Const.SESSION_QX)){
					//按钮权限放到session中
					session.setAttribute(USERNAME + Const.SESSION_QX, this.getUQX(USERNAME));
				}
				//更新登录IP
				this.getRemortIP(USERNAME);
				mv.setViewName("system/index/main");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				//session失效后跳转登录页面
				mv.setViewName("system/front/login");
			}
		} catch(Exception e){
			mv.setViewName("system/front/login");
			logger.error(e.getMessage(), e);
		}
		//读取系统名称
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME));
		mv.addObject("pd",pd);
		return mv;
	}

	/**获取用户权限
	 * @return
	 */
	public Map<String, String> getUQX(String USERNAME){
		PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		try {
			pd.put(Const.SESSION_USERNAME, USERNAME);
			//获取角色ID
			pd.put("ROLE_ID", appuserService.findByUsername(pd).get("ROLE_ID").toString());
			//获取角色信息
			pd = roleService.findObjectById(pd);
			//增
			map.put("adds", pd.getString("ADD_QX"));
			//删
			map.put("dels", pd.getString("DEL_QX"));
			//改
			map.put("edits", pd.getString("EDIT_QX"));
			//查
			map.put("chas", pd.getString("CHA_QX"));
			List<PageData> buttonQXnamelist = new ArrayList<PageData>();
			if("admin".equals(USERNAME)){
				//admin用户拥有所有按钮权限
				buttonQXnamelist = lxcbuttonService.listAll(pd);
			}else{
				//此角色拥有的按钮权限标识列表
				buttonQXnamelist = buttonrightsService.listAllBrAndQxname(pd);
			}
			for(int i=0;i<buttonQXnamelist.size();i++){
				//按钮权限
				map.put(buttonQXnamelist.get(i).getString("QX_NAME"),"1");
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return map;
	}


	/**根据角色权限获取本权限的菜单列表(递归处理)
	 * @param menuList：传入的总菜单
	 * @param roleRights：加密的权限字符串
	 * @return
	 */
	public List<Menu> readMenu(List<Menu> menuList,String roleRights){
		for(int i=0;i<menuList.size();i++){
			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
			//判断是否有此菜单权限
			if(menuList.get(i).isHasMenu()){
				//是：继续排查其子菜单
				this.readMenu(menuList.get(i).getSubMenu(), roleRights);
			}
		}
		return menuList;
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
			//获取session中的验证码
			String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);
			String code = KEYDATA[2];
			//判断效验码
			if(null == code || "".equals(code)){
				//效验码为空
				errInfo = NULL_CODE;
			}else{
				//登录过来的用户名
				String USERNAME = KEYDATA[0];
				//登录过来的密码
				String PASSWORD  = KEYDATA[1];
				pd.put("USERNAME", USERNAME);
				//判断登录验证码
				if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){
					//密码加密
					String passwd = MD5.md5(PASSWORD);
					pd.put("PASSWORD", passwd);
					//根据用户名和密码去读取用户信息
					pd = appuserService.getUserByNameAndPwd(pd);
					if(pd != null){
						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						appuserService.updateLastLogin(pd);
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
						//把用户信息放session中
						session.setAttribute(Const.SESSION_USER, user);
						//清除登录验证码的session
						session.removeAttribute(Const.SESSION_SECURITY_CODE);
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject();
						UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD);
						try {
							subject.login(token);
						} catch (AuthenticationException e) {
							errInfo = "身份验证失败！";
						}
					}else{
						//用户名或密码有误
						errInfo = "usererror";
						logBefore(logger, USERNAME+"登录系统密码或用户名错误");
					}
				}else{
					//验证码输入有误
					errInfo = CODE_ERROR;
				}
				if(Tools.isEmpty(errInfo)){
					//验证成功
					errInfo = CODE_SUCCESS;
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
	 * 前端注册页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register")
	@ResponseBody
	public Object toFrontRegister()throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		//注册状态
		String msg = "ok";
		pd = this.getPageData();
		//角色id 应聘面试人员 角色id
		pd.put("ROLE_ID",Const.REGISTER_CODE);
		//查询最大值加1
		pd.put("NUMBER",Integer.parseInt(appuserService.findByMaxNumber(pd).get("MAX_NUMBER").toString())+1);
		//状态
		pd.put("STATUS",1);
		//开通时间
		pd.put("START_TIME",Tools.date2Str(new Date()));
		//结束时间
		pd.put("END_TIME",DateUtil.getAfterDayDate("30"));
		//年限 1年
		pd.put("YEARS",DateUtil.getDiffYear(Tools.date2Str(new Date()),DateUtil.getAfterDayDate("30")));
		//ID
		pd.put("USER_ID", this.get32UUID());
		pd.put("RIGHTS", "");
		//最后登录时间
		pd.put("LAST_LOGIN", "");
		//IP
		pd.put("IP", "");
		//备注
		pd.put("BZ", "面试人员");
		pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
		if(null == appuserService.findByUsername(pd)) {
			//判断新增权限
			appuserService.saveU(pd);
		}else{
			msg = "failed";
		}
		pd.put("msg", msg);
		map.put("pd", pd);
		return  AppUtil.returnObject(new PageData(), map);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

	/** 更新登录用户的IP
	 * @param USERNAME
	 * @throws Exception
	 */
	public void getRemortIP(String USERNAME) throws Exception {
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		}else{
			ip = request.getHeader("x-forwarded-for");
		}
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}
}
