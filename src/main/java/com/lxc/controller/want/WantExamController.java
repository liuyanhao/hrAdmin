package com.lxc.controller.want;

import com.lxc.controller.base.BaseController;
import com.lxc.service.employee.issuejob.IssueJobManager;
import com.lxc.service.employee.resume.ResumeManager;
import com.lxc.service.job.job_type.Job_typeManager;
import com.lxc.service.job.jobmessage.JobMessageManager;
import com.lxc.util.Jurisdiction;
import com.lxc.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

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

    @Resource(name="jobmessageService")
    private JobMessageManager jobmessageService;

    @Resource(name="job_typeService")
    private Job_typeManager job_typeService;

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
        List<PageData> jobTypeList = job_typeService.listStartAll(pd); //职位类别
        mv.addObject("jobTypeList", jobTypeList);
        pd = jobmessageService.findById(pd);
        if(pd != null) {
            mv.addObject("pd", pd);
        }
        mv.setViewName("want/goExam");
        mv.addObject("msg","success");
        return mv;
    }


    @RequestMapping(value="/saveSubject")
    public ModelAndView saveSubject()throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"保存考试出题 saveSubject");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        mv.addObject("msg","success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 考试出题
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/go_subject")
    public ModelAndView goSubject()throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"考试出题 goSubject");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> jobTypeList = job_typeService.listStartAll(pd); //职位类别
        List<PageData> varList = jobmessageService.listSelectAll(pd);
        mv.addObject("jobTypeList", jobTypeList);
        mv.addObject("varList", varList );
        mv.addObject("setThemeUser",Jurisdiction.getUsername()); //出题人
        mv.setViewName("want/go_subject");
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
        String JOB_MESSAGE_ID = pd.get("JOB_MESSAGE_ID") != null ?  pd.get("JOB_MESSAGE_ID").toString() : "" ;
        pd = resumeService.findByCardId(pd);
        if(pd == null || pd.isEmpty()){
            mv.addObject("message","未找到与您身份证号码匹配的简历");
            if(pd != null) {
                mv.addObject("pd", pd);
            }
            mv.setViewName("want/goExam");
        }else{
            if(pd.getString("JOB_MESSAGE_ID") != JOB_MESSAGE_ID){ //判断职位是否符合
                mv.addObject("message","您没有参加该职务考试的权限");
                mv.addObject("pd", pd);
                mv.setViewName("want/goExam");
            }else{ //开始考试
                //查询符合条件的试卷

                //考试页面
            }


        }
        return mv;
    }

}
