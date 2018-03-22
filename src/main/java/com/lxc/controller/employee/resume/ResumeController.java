package com.lxc.controller.employee.resume;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.Page;
import com.lxc.service.employee.resume.ResumeManager;
import com.lxc.service.job.job_type.Job_typeManager;
import com.lxc.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：简历表
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-27
 */
@Controller
@RequestMapping(value="/resume")
public class ResumeController extends BaseController {
	
	String menuUrl = "resume/list.do"; //菜单地址(权限用)
	@Resource(name="resumeService")
	private ResumeManager resumeService;

	@Resource(name="job_typeService")
	private Job_typeManager job_typeService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Resume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("RESUME_ID", this.get32UUID());	//主键
		pd.put("CREATE_TIME", DateUtil.getTime().toString()); // 创建时间
		pd.put("CREATE_USER",Jurisdiction.getUsername());     //创建人
		pd.put("UPDATE_TIME", DateUtil.getTime().toString()); // 修改时间
		pd.put("UPDATE_USER",Jurisdiction.getUsername());     //修改人
		resumeService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Resume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		resumeService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Resume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_TIME", DateUtil.getTime().toString()); // 修改时间
		pd.put("UPDATE_USER",Jurisdiction.getUsername());   //修改人
		resumeService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Resume");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = resumeService.list(page);	//列出Resume列表
		mv.setViewName("employee/resume/resume_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> jobTypeList = job_typeService.listAll(pd);
		mv.addObject("jobTypeList", jobTypeList);
		mv.setViewName("employee/resume/resume_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> jobTypeList = job_typeService.listAll(pd); //职位类别
		mv.addObject("jobTypeList", jobTypeList);
		pd = resumeService.findById(pd);	//根据ID读取
		mv.setViewName("employee/resume/resume_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	/**去审核页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAudit")
	public ModelAndView goAudit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> jobTypeList = job_typeService.listAll(pd); //职位类别
		mv.addObject("jobTypeList", jobTypeList);
		pd = resumeService.findById(pd);	//根据ID读取
		mv.setViewName("employee/resume/resume_audit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Resume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			resumeService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Resume到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("员工姓名");	//1
		titles.add("性别");	//2
		titles.add("地址");	//3
		titles.add("电话");	//4
		titles.add("照片地址");	//5
		titles.add("身份证号码");	//6
		titles.add("E-mail");	//7
		titles.add("QQ");	//8
		titles.add("微信");	//9
		titles.add("邮编号码");	//10
		titles.add("政治面貌");	//11
		titles.add("民族");	//12
		titles.add("学历");	//13
		titles.add("爱好");	//14
		titles.add("特长");	//15
		titles.add("国籍");	//16
		titles.add("出生年月");	//17
		titles.add("宗教信仰");	//18
		titles.add("专业");	//19
		titles.add("个人简历");	//20
		titles.add("个人描述");	//21
		titles.add("备注");	//22
		titles.add("审核人编码");	//23
		titles.add("年龄");	//24
		titles.add("时间");	//25
		titles.add("审核状态");	//26
		titles.add("审核人姓名");	//27
		titles.add("推荐理由");	//28
		titles.add("面试成绩");	//29
		titles.add("面试评价");	//30
		titles.add("工作职位id");	//31
		titles.add("英语等级");	//32
		dataMap.put("titles", titles);
		List<PageData> varOList = resumeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("STAFF_NAME"));	//1
			vpd.put("var2", varOList.get(i).get("SEX").toString());	        //2
			vpd.put("var3", varOList.get(i).getString("ADDRESS"));	    //3
			vpd.put("var4", varOList.get(i).getString("PHONE"));	    //4
			vpd.put("var5", varOList.get(i).getString("PIC"));	        //5
			vpd.put("var6", varOList.get(i).getString("CARD_ID"));	    //6
			vpd.put("var7", varOList.get(i).getString("EMAIL"));	    //7
			vpd.put("var8", varOList.get(i).getString("QQ"));	        //8
			vpd.put("var9", varOList.get(i).getString("WECHAT"));	    //9
			vpd.put("var10", varOList.get(i).getString("POST_CODE"));	//10
			vpd.put("var11", varOList.get(i).getString("GOVEMMET"));	//11
			vpd.put("var12", varOList.get(i).getString("NATION"));	    //12
			vpd.put("var13", varOList.get(i).getString("LEARING"));	    //13
			vpd.put("var14", varOList.get(i).getString("HOBBY"));	    //14
			vpd.put("var15", varOList.get(i).getString("SUIT"));	    //15
			vpd.put("var16", varOList.get(i).getString("NATIONALITY"));	//16
			vpd.put("var17", varOList.get(i).getString("BIRTH"));	    //17
			vpd.put("var18", varOList.get(i).getString("FAITH"));	    //18
			vpd.put("var19", varOList.get(i).getString("SPEIALITY"));	//19
			vpd.put("var20", varOList.get(i).getString("RESUME"));	    //20
			vpd.put("var21", varOList.get(i).getString("DESCRIBES"));	//21
			vpd.put("var22", varOList.get(i).getString("REMARK"));	    //22
			vpd.put("var23", varOList.get(i).getString("USER_ID"));	    //23
			vpd.put("var24", varOList.get(i).get("AGE").toString());	    //24
			vpd.put("var25", varOList.get(i).getString("TIME"));	    //24
			vpd.put("var26", varOList.get(i).get("STATUS").toString());		//26
			vpd.put("var27", varOList.get(i).getString("USER_NAME"));	//27
			vpd.put("var28", varOList.get(i).getString("REASON"));	    //28
			vpd.put("var29", varOList.get(i).get("RESULT").toString());		//29
			vpd.put("var30", varOList.get(i).getString("SCORE"));		//30
			vpd.put("var31", varOList.get(i).get("JOB_MESSAGE_ID").toString());	//31
			vpd.put("var32", varOList.get(i).getString("DEGREE"));	    //32
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
