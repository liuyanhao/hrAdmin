package com.lxc.controller.staff.staffemployee;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.Page;
import com.lxc.service.job.job_type.Job_typeManager;
import com.lxc.service.staff.staffemployee.StaffEmployeeManager;
import com.lxc.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：员工档案信息表
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-16
 */
@Controller
@RequestMapping(value="/staffemployee")
public class StaffEmployeeController extends BaseController {
	
	String menuUrl = "staffemployee/list.do"; //菜单地址(权限用)
	@Resource(name="staffemployeeService")
	private StaffEmployeeManager staffemployeeService;

	@Resource(name="job_typeService")
	private Job_typeManager job_typeService;
	/**
	 * 上传头像照片
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/webuploaderSave")
	@ResponseBody
	public Object save(
			@RequestParam(required=false) MultipartFile file
	) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增图片");
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = "staffemployee", fileName = "";
		PageData pd = new PageData();
		if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			}else{
				System.out.println("上传失败");
			}
			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
			pd.put("PIC",fileName);
		}
		map.put("result", "ok");

		return AppUtil.returnObject(pd, map);
	}

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增StaffEmployee");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增图片");
		Map<String,String> map = new HashMap<String,String>();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STAFFEMPLOYEE_ID", this.get32UUID());	//主键
		pd.put("CREATE_TIME",Tools.date2Str(new Date())); //创建时间
		pd.put("CREATE_USER",Jurisdiction.getUsername()); //创建人
		pd.put("UPDATE_TIME",Tools.date2Str(new Date())); //修改时间
		pd.put("UPDATE_USER",Jurisdiction.getUsername()); //修改人
		staffemployeeService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除StaffEmployee");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		staffemployeeService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改StaffEmployee");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		String  ffile = "staff", fileName = "";
		ModelAndView mv = this.getModelAndView();
		PageData  pd = this.getPageData();
		staffemployeeService.edit(pd);
		pd.put("UPDATE_TIME",Tools.date2Str(new Date())); //修改时间
		pd.put("UPDATE_USER",Jurisdiction.getUsername()); //修改人
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
		logBefore(logger, Jurisdiction.getUsername()+"列表StaffEmployee");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = staffemployeeService.list(page);	//列出StaffEmployee列表
		mv.setViewName("staff/staffemployee/staffemployee_list");
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
		mv.setViewName("staff/staffemployee/staffemployee_edit");
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
		List<PageData> jobTypeList = job_typeService.listAll(pd);
		mv.addObject("jobTypeList", jobTypeList);
		pd = staffemployeeService.findById(pd);	//根据ID读取
		mv.setViewName("staff/staffemployee/staffemployee_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除StaffEmployee");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			staffemployeeService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出StaffEmployee到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("员工编号");	//1
		titles.add("员工姓名");	//2
		titles.add("性别");	//3
		titles.add("地址");	//4
		titles.add("电话");	//5
		titles.add("照片地址");	//6
		titles.add("身份证号码");	//7
		titles.add("E-mail");	//8
		titles.add("QQ");	//9
		titles.add("微信");	//10
		titles.add("邮编号码");	//11
		titles.add("政治面貌");	//12
		titles.add("民族");	//13
		titles.add("学历");	//14
		titles.add("爱好");	//15
		titles.add("特长");	//16
		titles.add("国籍");	//17
		titles.add("出生年月");	//18
		titles.add("宗教信仰");	//19
		titles.add("专业");	//20
		titles.add("个人简历");	//21
		titles.add("个人描述");	//22
		titles.add("备注");	//23
		titles.add("目前状况");	//24
		titles.add("工作编号");	//25
		titles.add("用户编号");	//26
		titles.add("年龄");	//27
		titles.add("登记时间");	//28
		titles.add("薪资");	//29
		dataMap.put("titles", titles);
		List<PageData> varOList = staffemployeeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("STAFF_ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("STAFF_NAME"));	    //2
			String SEX = varOList.get(i).get("SEX").equals(1)  ? "男" : "女";
			vpd.put("var3",SEX);	//3
			vpd.put("var4", varOList.get(i).getString("ADDRESS"));	    //4
			vpd.put("var5", varOList.get(i).getString("PHONE"));	    //5
			vpd.put("var6", varOList.get(i).getString("PIC"));	    //6
			vpd.put("var7", varOList.get(i).getString("CARD_ID"));	    //7
			vpd.put("var8", varOList.get(i).getString("EMAIL"));	    //8
			vpd.put("var9", varOList.get(i).getString("QQ"));	    //9
			vpd.put("var10", varOList.get(i).getString("WECHAT"));	    //10
			vpd.put("var11", varOList.get(i).getString("POST_CODE"));	    //11
			vpd.put("var12", varOList.get(i).getString("GOVEMMET"));	    //12
			vpd.put("var13", varOList.get(i).getString("NATION"));	    //13
			vpd.put("var14", varOList.get(i).getString("LEARING"));	    //14
			vpd.put("var15", varOList.get(i).getString("HOBBY"));	    //15
			vpd.put("var16", varOList.get(i).getString("SUIT"));	    //16
			vpd.put("var17", varOList.get(i).getString("NATIONALITY"));	    //17
			vpd.put("var18", varOList.get(i).getString("BIRTH"));	    //18
			vpd.put("var19", varOList.get(i).getString("FAITH"));	    //19
			vpd.put("var20", varOList.get(i).getString("SPEIALITY"));	    //20
			vpd.put("var21", varOList.get(i).getString("RESUME"));	    //21
			vpd.put("var22", varOList.get(i).getString("DESCRIBES"));	    //22
			vpd.put("var23", varOList.get(i).getString("REMARK"));	    //23
			vpd.put("var24", varOList.get(i).get("ISROMVE").toString());	    //24
			vpd.put("var25", varOList.get(i).get("JOB_ID").toString());	//25
			vpd.put("var26", varOList.get(i).get("USER_ID").toString());	//26
			vpd.put("var27", varOList.get(i).get("AGE").toString());	//27
			vpd.put("var28", varOList.get(i).getString("ADD_TIME"));	    //28
			vpd.put("var29", varOList.get(i).get("STIPEND_ID").toString());	//29
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
