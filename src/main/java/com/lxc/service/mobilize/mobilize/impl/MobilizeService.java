package com.lxc.service.mobilize.mobilize.impl;

import com.lxc.dao.DaoSupport;
import com.lxc.entity.Page;
import com.lxc.service.mobilize.mobilize.MobilizeManager;
import com.lxc.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 调动管理
 * 创建人：liuxc 1094921525
 * 创建时间：2018-01-27
 * @version
 */
@Service("mobilizeService")
public class MobilizeService implements MobilizeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("MobilizeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("MobilizeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("MobilizeMapper.edit", pd);
	}

	/**
	 * 审核
	 * @param pd
	 * @throws Exception
	 */
	public void audit(PageData pd) throws Exception {
		dao.update("MobilizeMapper.audit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MobilizeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MobilizeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MobilizeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MobilizeMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> auditList(Page page) throws Exception {
		return (List<PageData>)dao.findForList("MobilizeMapper.auditListPage", page);
	}

	/**
	 * 审核单条信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findAuditById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("MobilizeMapper.findAuditById", pd);
	}

}

