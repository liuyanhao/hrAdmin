package com.lxc.service.compensation.grantidmanager;

import com.lxc.entity.Page;
import com.lxc.util.PageData;

import java.util.List;

/** 
 * 说明： 薪酬发放接口
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-21
 * @version
 */
public interface GrantIdManagerManager{

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
	 * 查询需要发放薪酬
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> stipendManagerlistPage(Page page)throws  Exception;

	/**
	 * 查询需要发放薪资的
	 * @param pd
	 * @return
	 */
	PageData findByStipend(PageData pd)throws  Exception;
}

