package com.lxc.service.employment.interviewinfo.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.employment.interviewinfo.InterviewInfoManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 面试人账户表
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-27
 * @version
 */
@Service("interviewinfoService")
public class InterviewInfoService implements InterviewInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("InterviewInfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("InterviewInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("InterviewInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("InterviewInfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("InterviewInfoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InterviewInfoMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("InterviewInfoMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 录取列表
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> empolyList(Page page)throws Exception {
		return (List<PageData>)dao.findForList("InterviewInfoMapper.empolyListPage", page);
	}

}

