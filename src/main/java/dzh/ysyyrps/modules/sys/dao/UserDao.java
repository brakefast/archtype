/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.web.BootstrapTablePage;
import com.ciocem.common.web.JqGridTablePage;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.sys.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户DAO接口
 * @author tyluo
 * @version 2014-05-16
 */
@MyBatisDao
public interface UserDao extends CrudDao<User,UserVO> {
	
	/**
	 * 根据登录名称查询用户
	 * @return
	 */
	public User getByLoginName(User user);

	//查询全体用户  暂时使用此方法
	public List<User> findAllUser();

	/**
	 * 根据当前登录组织查询用户
	 * @return
	 */
	List<UserVO> getOrgUserByPage(@Param("page") JqGridTablePage page, @Param("entity") UserVO userVO);
	List<UserVO> getOrgUserByPage(@Param("page") BootstrapTablePage page, @Param("entity") UserVO userVO);
	/**
	 * 根据当前登录组织查询用户总数
	 * @return
	 */
	int getTotalOrgUserByPage(@Param("entity") UserVO userVO);

	/**
	 * 通过OfficeId获取用户列表，仅返回用户id和name（树查询用户时用）
	 * @param user
	 * @return
	 */
	public List<User> findUserByOfficeId(User user);
	
	/**
	 * 查询全部用户数目
	 * @return
	 */
	public long findAllCount(User user);
	

	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(User user);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);

	/**
	 * 根据实体名称和字段名称和字段值获取唯一记录
	 * 
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public  User findUniqueByProperty(@Param(value = "propertyName") String propertyName, @Param(value = "value") Object value);

	/**
	 * 用户树（人力资源树挂用户（员工对应用户））
	 * 【注】兼职问题先不考虑
	 * @param user4TreeVO
	 * @return
	 */
	public List<User4TreeVO> getUserTreeData(@Param(value = "entity") User4TreeVO user4TreeVO);
	
	
	/**
	 * 用户树（人力资源树挂用户（员工对应用户））并标记是否已选
	 * 【注】兼职问题先不考虑
	 * @param unSelUser4TreeVO
	 * @param roleId
	 * @return
	 */
	public List<UnSelUser4TreeVO> getUnSelUserTreeData(@Param(value = "entity") UnSelUser4TreeVO unSelUser4TreeVO, @Param(value = "roleId") String roleId);

	/**
	 * 法人组织
	 * @param org4TreeVO
	 * @return
	 */
	public List<UserOrg4TreeVO> getOrgTreeData(@Param(value = "entity") UserOrg4TreeVO org4TreeVO);

	/**
	 * 角色信息以及用户所属角色
	 * @param userRoleVO
	 * @return
	 */
	public List<UserRoleVO> getRoleList(@Param(value = "entity") UserRoleVO userRoleVO);

	/**
	 * 
	 * @param userRight4TreeVO
	 * @return
	 */
	public List<UserRight4TreeVO> getRightTreeData(@Param(value = "entity") UserRight4TreeVO userRight4TreeVO);

	public int getCount(@Param(value = "entity") User user);

	/**
	 * 插入用户登录组织关系
	 * @param userId
	 * @param userOrgs
	 * @return
	 */
	int insertUserOrgs(@Param(value = "userId") String userId, @Param(value = "userOrgs") List<UserOrgVO> userOrgs);
	
	/**
	 * 删除用户登录组织关系
	 * @param userId
	 * @param orgIds
	 * @return
	 */
	int deleteUserOrgs(@Param(value = "userId") String userId, @Param(value = "orgIds") List<String> orgIds);
	
	/**
	 * 获取用户所属角色编号列表
	 * @param orgId
	 * @param userId
	 * @return
	 */
	List<String> getRoleNoList(@Param(value = "orgId") String orgId, @Param(value = "userId") String userId);

	/**
	 * 获取用户的所有登录组织
	 * @param id
	 * @return
	 */
	public List<LoginOrgVO> getUserOrgs(@Param(value = "userId") String id);

	/**
	 * 根据用户ID查询密码
	 * @param userId
	 * @return
     */
	public String findPasswordByUserId(String userId);
	
	/**
	 * 锁定用户
	 * @param id
	 * @return
	 */
	int lockUserById(String id);
	
	/**
	 * 解锁用户
	 * @param id
	 * @return
	 */
	int unLockUserById(String id);

	/**
	 * 根据角色ID集合查询 用户信息
	 * @param userTableVO
	 * @return
     */
	public List<UserTableVO> getUserLsByRoleIds(UserTableVO userTableVO);
	/**
	 * 根据用户ID集合查询 用户信息
	 * @param userTableVO
	 * @return
     */
	public List<UserTableVO> getUserLsByUserIds(UserTableVO userTableVO);

	/**
	 * 获取用户数据-项目授权
	 * @param page
	 * @param search
	 * @return
	 */
	public List<UserDataVO> getUserData(@Param(value = "page") JqGridTablePage page, @Param(value = "entity") UserDataVO search);

	/**
	 * 获取用户数据数量-项目授权
	 * @param search
	 * @return
	 */
	public int getTotalUserData(@Param(value = "entity") UserDataVO search);


	/**
	 * 根据角色查询用户
	 * @return
     */
	public List<UserTableVO> getUserRoleList(UserTableVO userTableVO);

	/**
	 * 根据岗位查询用户进行
	 * @param userTableVO
	 * @return
	 */
	public List<UserTableVO> getUserStationList(UserTableVO userTableVO);

	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 */
	public Map<String, String> getUserInfo(String id);

	/**
	 * 根据岗位id获取用户ids
	 * @param stationId
	 * @return
	 */
	public List<String> getUserIdsByStationId(String stationId);

	/**
	 * 根据员工id获取用户ids
	 * @param id
	 * @return
	 */
	public List<String> getUserIdByEmpId(String id);

	/**
	 * 获取有权限的项目
	 * @param userId
	 * @param orgId 
	 * @return
	 */
	public List<UserProjectInfoVO> getMyProjectInfos(@Param(value = "userId") String userId, @Param(value = "orgId") String orgId, @Param(value = "keyWord") String keyWord);

	/**
	 * 获取相关数量
	 * @param userId
	 * @param projectId
	 * @return
	 */
	public int getProjectCount(@Param(value = "userId") String userId, @Param(value = "projectId") String projectId);
}
