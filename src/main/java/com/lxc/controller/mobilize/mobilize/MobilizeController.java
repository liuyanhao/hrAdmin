package com.lxc.controller.mobilize.mobilize;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.Page;
import com.lxc.enums.EmployeeState;
import com.lxc.service.mobilize.mobilize.MobilizeManager;
import com.lxc.service.staff.staffemployee.StaffEmployeeManager;
import com.lxc.util.AppUtil;
import com.lxc.util.Jurisdiction;
import com.lxc.util.ObjectExcelView;
import com.lxc.util.PageData;
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
 * 说明：调动管理
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-27
 */
@Controller
@RequestMapping(value="/mobilize")
public class MobilizeController extends BaseController {
	
	String menuUrl = "mobilize/list.do"; //调动表 菜单地址(权限用)
	String menuUrl2 = "mobilize/doSelectAll.do"; //调动管理 菜单地址(权限用)
	@Resource(name="mobilizeService")
	private MobilizeManager mobilizeService;

	@Resource(name="staffemployeeService")
	private StaffEmployeeManager staffemployeeService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Mobilize");
		if(!Jurisdiction.buttonJurisdiction(menuUrl2, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MOBILIZE_ID", this.get32UUID());	//主键
		pd.put("EMP_NAME", Jurisdiction.getUsername());	//审核人
		mobilizeService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Mobilize");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		mobilizeService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Mobilize");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mobilizeService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Mobilize");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = mobilizeService.list(page);	//列出Mobilize列表
		mv.setViewName("mobilize/mobilize/mobilize_list");
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
		mv.setViewName("mobilize/mobilize/mobilize_edit");
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
		pd = mobilizeService.findById(pd);	//根据ID读取
		mv.setViewName("mobilize/mobilize/mobilize_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Mobilize");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			mobilizeService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Mobilize到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("审核人编号");	//1
		titles.add("审核人名称");	//2
		titles.add("工作职位编码");	//3
		titles.add("调用原因");	//4
		titles.add("审核状态");	//5
		dataMap.put("titles", titles);
		List<PageData> varOList = mobilizeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("EMP_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("EMP_NAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("JOB_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("CAUSE"));	    //4
			vpd.put("var5", varOList.get(i).getString("STATUS"));	    //5
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

	@RequestMapping(value="/doSelectAll")
	public ModelAndView doSelectAll(Page page)throws  Exception{
		logBefore(logger, Jurisdiction.getUsername()+"调用管理列表Mobilize");
		if(!Jurisdiction.buttonJurisdiction(menuUrl2, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String LEARING = pd.getString("LEARING");				//学历
		if(null != LEARING && !"".equals(LEARING)){
			pd.put("LEARING", LEARING.trim());
		}else {
			pd.put("LEARING", null);
		}
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}else{
			pd.put("keywords", null);
		}
		pd.put("STATES", EmployeeState.PASS.getCode()); //通过
		page.setPd(pd);
		List<PageData> varList = new ArrayList<PageData>();
		varList = staffemployeeService.getStatePass(page);
		mv.setViewName("mobilize/mobilize/mobilizeAll_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}



	@RequestMapping(value="/goManoeuvre" )
	public ModelAndView goManoeuvre()throws  Exception{
	ModelAndView mv = this.getModelAndView();
	PageData pd = new PageData();
	pd = this.getPageData();
	pd = staffemployeeService.findById(pd);	//根据ID读取
		mv.setViewName("mobilize/mobilize/manoeuvre_edit");
		mv.addObject("msg", "manoeuvre");
		mv.addObject("pd", pd);
		return mv;
   }

	@RequestMapping(value="/manoeuvre")
	public ModelAndView manoeuvre() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Mobilize");
		if(!Jurisdiction.buttonJurisdiction(menuUrl2, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mobilizeService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
}
