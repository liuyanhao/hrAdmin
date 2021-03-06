package com.lxc.service.job.job_type;

import com.lxc.entity.Page;
import com.lxc.util.PageData;

import java.util.List;

/** 
 * 说明： 职位类型模块接口
 * 创建人：lxc Q1094921525
 * 创建时间：2018-03-14
 * @version
 */
public interface Job_typeManager{

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

    /**列表(全部是启用)
     * @param pd
     * @throws Exception
     */
    public List<PageData> listStartAll(PageData pd)throws Exception;

	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
}

