package com.lxc.service.mobilize.mobilize;

import com.lxc.entity.Page;
import com.lxc.util.PageData;

import java.util.List;

/** 
 * 说明： 调动管理接口
 * 创建人：lxc Q1094921525
 * 创建时间：2018-01-27
 * @version
 */
public interface MobilizeManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;

	/**审核
	 * @param pd
	 * @throws Exception
	 */
	public void audit(PageData pd)throws Exception;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**
	 * 调动审核列表
	 * @param page
	 * @return
	 */
	public List<PageData> auditList(Page page)throws Exception;

	/**
	 * 去查询 需要审核的 信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	PageData findAuditById(PageData pd)throws Exception;
}

