package com.lxc.service.compensation.grantidmanager.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.compensation.grantidmanager.GrantIdManagerManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 薪酬发放
 * 创建人：liuxc 1094921525
 * 创建时间：2018-03-21
 * @version
 */
@Service("grantidmanagerService")
public class GrantIdManagerService implements GrantIdManagerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GrantIdManagerMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GrantIdManagerMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GrantIdManagerMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GrantIdManagerMapper.datalistPage", page);
	}

	/**
	 * 查询需要发放薪资的员工薪资列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> stipendManagerlistPage(Page page)throws  Exception{
		return  (List<PageData>) dao.findForList("GrantIdManagerMapper.stipendManagerlistPage",page);
	}

	/**
	 * 查询需要发放薪资员工薪资信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByStipend(PageData pd) throws Exception {
		return (PageData)dao.findForObject("GrantIdManagerMapper.findByStipend", pd);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GrantIdManagerMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GrantIdManagerMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GrantIdManagerMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

