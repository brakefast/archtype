/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import dzh.ysyyrps.modules.hr.entity.Organization;
import dzh.ysyyrps.modules.sys.entity.Menu;
import dzh.ysyyrps.modules.sys.vo.Menu4LogVO;
import dzh.ysyyrps.modules.sys.vo.MenuVO;
import org.apache.ibatis.annotations.Param;

/**
 * 菜单DAO接口
 * @author tyluo
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu,MenuVO> {

	 List<Menu> findByUserId(Menu menu);

	 List<Menu> findUserMenus(@Param(value = "orgId") String orgId, @Param(value = "userId") String userId);

	/***
	 * 查找菜单调用
	 * @param orgId
	 * @param userId
	 * @param name
	 * @return
	 */
	 List<Menu> searchUserMenus(@Param(value = "orgId") String orgId, @Param(value = "userId") String userId, @Param(value = "name") String name);

	 List<Menu> getChildren(String id);
	
	/**
	 * 仅用于日志组装路径信息
	 * @return
	 */
	public List<Menu4LogVO> getMenu4Log();

	/**
	 * 查询该菜单节点上的所有父节点
	 * @param menuId
	 * @return
	 */
	public List<Menu> getMenuParent(@Param(value = "menuId") String menuId, @Param(value = "dbName") String dbName);

	/**
	 * 根据id递归查询所有下级
	 * @param dbName
	 * @param id
	 * @return
	 */
	public List<Menu> getSubMenuLs(@Param(value = "dbName") String dbName, @Param(value = "id") String id);
}
