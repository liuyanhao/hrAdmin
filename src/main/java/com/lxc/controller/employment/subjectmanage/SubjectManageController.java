package com.lxc.controller.employment.subjectmanage;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.Page;
import com.lxc.service.employment.subjectmanage.SubjectManageManager;
import com.lxc.service.subject.subjecttype.SubjectTypeManager;
import com.lxc.service.subject.subjecttypemx.SubjectTypeMxManager;
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
 * 说明：题库信息表
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-27
 */
@Controller
@RequestMapping(value="/subjectmanage")
public class SubjectManageController extends BaseController {
	
	String menuUrl = "subjectmanage/list.do"; //菜单地址(权限用)
	@Resource(name="subjectmanageService")
	private SubjectManageManager subjectmanageService;

	@Resource(name="subjecttypeService")
	private SubjectTypeManager subjecttypeService;

	@Resource(name="subjecttypemxService")
	private SubjectTypeMxManager subjecttypemxService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增SubjectManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SUBJECTMANAGE_ID", this.get32UUID());	//主键
		pd.put("ISSUE_PERSON",Jurisdiction.getUsername()); //出题人
		pd.put("ISSUE_TIME", Tools.date2Str(new Date())); //发布时间
		subjectmanageService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除SubjectManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		subjectmanageService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改SubjectManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ISSUE_PERSON",Jurisdiction.getUsername()); //出题人
		subjectmanageService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表SubjectManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//试卷类型
		List<PageData> typeList= subjecttypeService.listAll(pd);
		String keywords = pd.getString("keywords");				//关键词检索条件
		String SUBJECT_TYPE = pd.getString("SUBJECT_TYPE");		//题目类型
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		if(null != SUBJECT_TYPE && "".equals(SUBJECT_TYPE)){
			pd.put("SUBJECT_TYPE", SUBJECT_TYPE);
		}
		page.setPd(pd);
		List<PageData>	varList = subjectmanageService.list(page);	//列出SubjectManage列表
		mv.setViewName("employment/subjectmanage/subjectmanage_list");
		mv.addObject("varList", varList);
		mv.addObject("typeList", typeList);
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
		List<PageData> typeList= subjecttypeService.listAll(pd);
		mv.addObject("typeList", typeList);
		mv.setViewName("employment/subjectmanage/subjectmanage_edit");
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
		List<PageData> typeList= subjecttypeService.listAll(pd);
		pd = subjectmanageService.findById(pd);	//根据ID读取
		mv.addObject("typeList", typeList);
		mv.setViewName("employment/subjectmanage/subjectmanage_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除SubjectManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			subjectmanageService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出SubjectManage到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("题目");	//1
		titles.add("资源地址");	//2
		titles.add("A选项");	//3
		titles.add("B选项");	//4
		titles.add("C选项");	//5
		titles.add("D选项");	//6
		titles.add("E选项");	//7
		titles.add("F选项");	//8
		titles.add("正确选项");	//9
		titles.add("分值");	//10
		titles.add("出题时间");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = subjectmanageService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SUBJECT_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("SUBJECT_TYPE"));	    //2
			vpd.put("var3", varOList.get(i).getString("SELECT_A"));	    //3
			vpd.put("var4", varOList.get(i).getString("SELECT_B"));	    //4
			vpd.put("var5", varOList.get(i).getString("SELECT_C"));	    //5
			vpd.put("var6", varOList.get(i).getString("SELECT_D"));	    //6
			vpd.put("var7", varOList.get(i).getString("SELECT_E"));	    //7
			vpd.put("var8", varOList.get(i).getString("SELECT_F"));	    //8
			vpd.put("var9", varOList.get(i).getString("SELECT_TURE"));	    //9
			vpd.put("var10", varOList.get(i).get("ISSUE_PERSON").toString());	//10
			vpd.put("var11", varOList.get(i).getString("ISSUE_TIME"));	    //11
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
