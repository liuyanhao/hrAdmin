package com.lxc.service.subject.subjecttypemx;

import com.lxc.entity.Page;
import com.lxc.util.PageData;

import java.util.List;

/** 
 * 说明： 试卷分类表(明细)接口
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-19
 * @version
 */
public interface SubjectTypeMxManager{

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
	
	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception;

	/**
	 * 查询符合条件的
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    List<PageData> listSubjetType(PageData pd)throws  Exception;
}

