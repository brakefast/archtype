package dzh.ysyyrps.modules.sys.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.web.JqGridTablePage;
import dzh.ysyyrps.modules.sys.entity.Role;
import dzh.ysyyrps.modules.sys.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色DAO接口
 * @author tyluo
 * @version 2017-04-25
 */
@MyBatisDao
public interface RoleDao extends CrudDao<Role,RoleVO> {

	/**
	 * 根据用户id获取所属角色
	 * @param userId
	 * @param orgId
	 * @return
	 */
	List<Role> getRoleListByUserId(@Param(value = "userId") String userId, @Param(value = "orgId") String orgId);
	/**
	 * 根据用户id获取所属角色
	 * @param userId
	 * @return
	 */
	List<Role> getRoleListByUserId2(@Param(value = "userId") String userId);
	/**
	 * 获取组织下所有角色
	 * @param orgId
	 * @param filterFlag
	 * @return
	 */
	List<Role> findAllList(@Param(value = "orgId") String orgId, @Param(value = "keyword") String keyword, @Param(value = "filterFlag") String filterFlag);

	/**
	 * 
	 * @param roleId
	 * @param userId
	 * @param orgId
	 * @return
	 */
	int getTotalByRoleIdAndUserId(@Param(value = "roleId") String roleId, @Param(value = "userId") String userId, @Param(value = "orgId") String orgId);

	/**
	 * 角色权限数据
	 * @param roleRight4TreeVO
	 * @return
	 */
	List<RoleRight4TreeVO> getRightTreeData(@Param(value = "entity") RoleRight4TreeVO roleRight4TreeVO);

	/**
	 * 获取用户通过角色数据
	 * @param page
	 * @param user4RoleVO
	 * @return
	 */
	List<User4RoleVO> getUserByRoleId(@Param(value = "page") JqGridTablePage page, @Param(value = "entity") User4RoleVO user4RoleVO);

	/**
	 * 查询符合条件的数据数量
	 * @param role
	 * @return
	 */
	int getCount(@Param(value = "entity") Role role);

	/**
	 * 插入角色所属用户
	 * @param roleUserVOs
	 * @return
	 */
	int insertRoleUsers(@Param(value = "roleUsers") List<RoleUserVO> roleUserVOs);



	/**
	 * 根据RoleId查询在职员工的用户ID
	 * @param roleIdLs
	 */
	List<String> getUserIdLsByRoleIdLs(@Param(value = "roleIdLs") List<String> roleIdLs);

	/**
	 * 删除角色用户
	 * @param orgId
	 * @param ctype
	 * @param ids
	 * @param busId 
	 * @return
	 */
	int deleteRoleUsers(@Param(value = "orgId") String orgId, @Param(value = "ctype") String ctype, @Param(value = "ids") List<String> ids, @Param(value = "busId") String busId);

	/**
	 * 获取用户数据通过角色id
	 * @param roleId
	 * @param orgId
	 * @return
	 */
	List<String> getUserIdsByRoleId(@Param(value = "roleId") String roleId, @Param(value = "orgId") String orgId);

	/**
	 * 获取用户数据通过角色id
	 * @param roleId
	 * @return
	 */
	List<String> getUserIdLsByRoleId(@Param(value = "roleId") String roleId);
	/**
	 * 获取角色数据
	 * @param page
	 * @param search
	 * @return
	 */
	List<RoleDataVO> gerRoleData(@Param(value = "page") JqGridTablePage page, @Param(value = "entity") RoleDataVO search);
	/**
	 * 获取总的数据量
	 * @param search
	 * @return
	 */
	int gerCountRoleData(@Param(value = "entity") RoleDataVO search);

}