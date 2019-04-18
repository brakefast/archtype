/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.dao.TreeDao;
import dzh.ysyyrps.modules.sys.entity.Area;
import dzh.ysyyrps.modules.sys.vo.AreaVO;

/**
 * 区域DAO接口
 * @author tyluo
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends CrudDao<Area,AreaVO> {
	/**
	 * 查询所有数据列表
	 * @return
	 */
	public List<Area> findAllList(Area area);

	/**
	 * 获取当前节点的父节点信息
	 * @param id
	 * @return
	 */
	public Area getParent(String id);

	/**
	 * 获取当前节点的子节点信息
	 * @param id
	 * @return
	 */
	public List<Area> getChildren(String id);
}
