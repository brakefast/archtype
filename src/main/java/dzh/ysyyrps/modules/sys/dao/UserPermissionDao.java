package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import dzh.ysyyrps.modules.sys.entity.UserPermission;
import dzh.ysyyrps.modules.sys.vo.UserPermissionVO;

/**
 * 用户授权权限数据DAO接口
 * @author tyluo
 * @version 2017-04-24
 */
@MyBatisDao
public interface UserPermissionDao extends CrudDao<UserPermission,UserPermissionVO> {

	/**
	 * 删除用户不存在的权限
	 * @param userPermissionVO
	 * @return
	 */
	int delUserPermission(@Param(value = "entity") UserPermissionVO userPermissionVO);

	/**
	 * 添加用户新增的权限
	 * @param userPermissionList_Add
	 */
	void insertUserPermission(@Param(value = "userPermission") List<UserPermissionVO> userPermissionList_Add);

	/**
	 * 获取所拥有权限
	 * @param orgId
	 * @param userId
	 * @return
	 */
	List<String> getUserPermissionList(@Param(value = "orgId") String orgId, @Param(value = "userId") String userId);
	
	/**
	 * 获取系统管理员权限
	 * @return
	 */
	List<String> getAdminPermissionList();
	
}