package com.lxc.controller.want;

import com.lxc.controller.base.BaseController;
import com.lxc.service.employee.issuejob.IssueJobManager;
import com.lxc.service.employee.resume.ResumeManager;
import com.lxc.util.Jurisdiction;
import com.lxc.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by Liuxicai on 2018/3/11 0011.
 */
@Controller
@RequestMapping(value="/wantexam")
public class WantExamController  extends BaseController {
    String menuUrl = "wantexam/list.do"; //菜单地址(权限用)
    @Resource(name="issuejobService")
    private IssueJobManager issuejobService;

    @Resource(name="resumeService")
    private ResumeManager resumeService;

    /**
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toExam")
    public ModelAndView toExam()throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"考试登记 toExam");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("want/goExam");
        mv.addObject("msg","success");
        return mv;
    }

    /**
     * 考试登记
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toExamList")
    public ModelAndView toExamList()throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"考试登记 toExamList");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = resumeService.findByCardId(pd);
        if(pd.isEmpty()){
            mv.addObject("msg","未找到与您身份证号码匹配的简历");
            mv.setViewName("want/goExam");
        }
        mv.addObject("msg","success");
        return mv;
    }

}
