package com.lxc.service.job.jobmessage.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.job.jobmessage.JobMessageManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 职位工作类型表
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-11
 * @version
 */
@Service("jobmessageService")
public class JobMessageService implements JobMessageManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("JobMessageMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("JobMessageMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("JobMessageMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("JobMessageMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("JobMessageMapper.listAll", pd);
	}

	/**
	 * 根据职位类型查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listJobType(PageData pd_Type) throws Exception {
		return (List<PageData>)dao.findForList("JobMessageMapper.listJobType", pd_Type);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("JobMessageMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("JobMessageMapper.deleteAll", ArrayDATA_IDS);
	}

}

