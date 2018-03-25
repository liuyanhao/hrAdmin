package com.lxc.service.subject.subjecttype.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.subject.subjecttype.SubjectTypeManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 试卷分类表
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-19
 * @version
 */
@Service("subjecttypeService")
public class SubjectTypeService implements SubjectTypeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SubjectTypeMapper.save", pd);
	}
	
	/**逻辑 删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.update("SubjectTypeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SubjectTypeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SubjectTypeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SubjectTypeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SubjectTypeMapper.findById", pd);
	}
	
	/**逻辑 批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.update("SubjectTypeMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 列表 （全部启用的）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listStartAll(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SubjectTypeMapper.listStartAll", pd);
	}

}

