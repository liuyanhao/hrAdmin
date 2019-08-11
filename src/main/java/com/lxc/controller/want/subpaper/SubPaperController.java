package com.lxc.controller.want.subpaper;

import com.lxc.controller.base.BaseController;
import com.lxc.entity.Page;
import com.lxc.service.want.subpaper.SubPaperManager;
import com.lxc.service.want.subpapermx.SubPaperMxManager;
import com.lxc.util.*;
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
 * 说明：试卷
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-22
 */
@Controller
@RequestMapping(value="/subpaper")
public class SubPaperController extends BaseController {

	//菜单地址(权限用)
	String menuUrl = "subpaper/list.do";
	@Resource(name="subpaperService")
	private SubPaperManager subpaperService;
	
	@Resource(name="subpapermxService")
	private SubPaperMxManager subpapermxService;
	
	/**保存
	 * @return  ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增SubPaper");
		//校验权限
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//主键
		pd.put("SUBPAPER_ID", this.get32UUID());
		//创建人
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		//创建时间
		pd.put("CREATE_TIME", Tools.date2Str(new Date()));
		subpaperService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 * @return  Object
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除SubPaper");
		//校验权限
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null ;}
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "success";
		if(Integer.parseInt(subpapermxService.findCount(pd).get("zs").toString()) > 0){
			errInfo = "false";
		}else{
			subpaperService.delete(pd);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @return  ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改SubPaper");
		//校验权限
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;}
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		subpaperService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 * @return  ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表SubPaper");
		//校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//关键词检索条件
		String keywords = pd.getString("keywords");
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		//列出SubPaper列表
		List<PageData>	varList = subpaperService.list(page);
		mv.setViewName("want/subpaper/subpaper_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		//按钮权限
		mv.addObject("QX",Jurisdiction.getHC());
		return mv;
	}
	
	/**去新增页面
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("want/subpaper/subpaper_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**
	  * 去修改页面
	  * @return  ModelAndView
	  * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//根据ID读取
		pd = subpaperService.findById(pd);
		mv.setViewName("want/subpaper/subpaper_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**导出到excel
	  * @return  ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername() + "导出SubPaper到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		//1
		titles.add("工作职位id");
		//2
		titles.add("创建人");
		//3
		titles.add("创建时间");
		//4
		titles.add("是否启用");
		dataMap.put("titles", titles);
		List<PageData> varOList = subpaperService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			//1
			vpd.put("var1", varOList.get(i).getString("JOB_MANAGER_ID"));
			//2
			vpd.put("var2", varOList.get(i).getString("CREATE_USER"));
			//3
			vpd.put("var3", varOList.get(i).getString("CREATE_TIME"));
			//4
			vpd.put("var4", varOList.get(i).get("STATUS").toString());
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
