package com.lxc.service.subject.subjecttypemx.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.subject.subjecttypemx.SubjectTypeMxManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 试卷分类表(明细)
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-19
 * @version
 */
@Service("subjecttypemxService")
public class SubjectTypeMxService implements SubjectTypeMxManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SubjectTypeMxMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("SubjectTypeMxMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SubjectTypeMxMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SubjectTypeMxMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SubjectTypeMxMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SubjectTypeMxMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SubjectTypeMxMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SubjectTypeMxMapper.findCount", pd);
	}

	/**
	 * 根据 试卷类别 级联查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listSubjetType(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SubjectTypeMxMapper.listSubjetType", pd);
	}

}

