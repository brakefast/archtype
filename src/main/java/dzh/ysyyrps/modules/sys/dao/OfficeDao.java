/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.dao.TreeDao;
import dzh.ysyyrps.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author tyluo
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office,Office> {
	
	public Office getByCode(String code);
	
	/**
	 * 查询所有数据列表
	 * @param entity
	 * @return
	 */
	public List<Office> findAllList(Office office);
}
