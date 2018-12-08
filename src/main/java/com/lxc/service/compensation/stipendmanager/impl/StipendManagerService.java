package com.lxc.service.compensation.stipendmanager.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.compensation.stipendmanager.StipendManagerManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 薪酬等级表
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-27
 * @version
 */
@Service("stipendmanagerService")
public class StipendManagerService implements StipendManagerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("StipendManagerMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.update("StipendManagerMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("StipendManagerMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StipendManagerMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StipendManagerMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StipendManagerMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.update("StipendManagerMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 *查询明细总数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCount(PageData pd) throws Exception {
		return (PageData)dao.findForObject("StipendManagerMapper.findCount",pd);
	}

	public void audit(PageData pd) throws Exception {
		dao.update("StipendManagerMapper.audit", pd);
	}

}

