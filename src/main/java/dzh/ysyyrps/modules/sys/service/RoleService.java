package dzh.ysyyrps.modules.sys.service;

import com.ciocem.common.service.CrudService;
import com.ciocem.common.utils.PubUtil;
import com.ciocem.common.web.JqGridTablePage;
import dzh.ysyyrps.modules.sys.dao.RoleDao;
import dzh.ysyyrps.modules.sys.entity.Role;
import dzh.ysyyrps.modules.sys.utils.UserUtils;
import dzh.ysyyrps.modules.sys.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * 角色Service
 * @author tyluo
 * @version 2017-04-25
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends CrudService<RoleDao, Role, RoleVO> {
    @Autowired
	private RoleDao roleDao;

    /**
     * 获取用户所拥有角色（当前登录组织下）
     * @param userId
     * @return
     */
	public List<Role> getRoleListByUserId(String userId) {
		return roleDao.getRoleListByUserId(userId,UserUtils.getLoginOrg());
	}
	/**
	 * 获取用户所拥有角色
	 * @param userId
	 * @return
	 */
	public List<Role> getRoleListByUserId2(String userId) {
		return roleDao.getRoleListByUserId2(userId);
	}
	/**
	 * 获取所有角色，当前登陆组织下
	 * @return
	 */
	public List<Role> findAllRole(String keyWord,String filterFlag) {
		return roleDao.findAllList(UserUtils.getLoginOrg(),keyWord,filterFlag);
	}
	/**
	 * 获取所有角色，当前登陆组织下
	 * @return
	 */
	public List<Role> findAllRole() {
		return roleDao.findAllList(UserUtils.getLoginOrg(),null, null);
	}

	/**
	 * 当前组织下是否存在用户对应的角色关系
	 * @param roleId
	 * @param userId
	 * @return
	 */
	public int getTotalByRoleIdAndUserId(String roleId, String userId) {		
		return roleDao.getTotalByRoleIdAndUserId(roleId, userId,UserUtils.getLoginOrg());
	}


	public JqGridTablePage getRoleDataByKeyword(JqGridTablePage page, String keyword, String filterFlag) {
		List<Role> roles = findAllRole(keyword,filterFlag);
		if(PubUtil.isNotEmpty(roles)){
			page.setRows(roles);
			page.setTotal(roles.size());
		}
		return page;
	}

	public List<RoleRight4TreeVO> getRightTreeData(RoleRight4TreeVO roleRight4TreeVO) {
		return roleDao.getRightTreeData(roleRight4TreeVO);
	}

	public void getUserByRoleId(JqGridTablePage page, User4RoleVO user4RoleVO) {
		List<User4RoleVO> list = roleDao.getUserByRoleId(page,user4RoleVO);
		page.setRows(list);
	}

	/**
	 * 数据是否存在
	 * @param role
	 * @return
	 */
	public boolean isExists(Role role) {		
		int count = roleDao.getCount(role);
		return (count > 0);
	}
	
	public int insertRoleUsers(List<RoleUserVO> roleUserVOs) {
		return roleDao.insertRoleUsers(roleUserVOs);
	}
	
	public int deleteRoleUsers(String orgId,String ctype,List<String> ids, String busId) {
		return roleDao.deleteRoleUsers(orgId,ctype,ids, busId);
	}

	public List<String> getUserIdsByRoleId(String roleId, String orgId) {		
		return roleDao.getUserIdsByRoleId(roleId,orgId);
	}

	public List<String> getUserIdLsByRoleId(String roleId) {
		return roleDao.getUserIdLsByRoleId(roleId);
	}

	public JqGridTablePage gerRoleData(JqGridTablePage page, RoleDataVO search) {
		List<RoleDataVO> list = roleDao.gerRoleData(page, search);
		page.setRows(list);
		int count = roleDao.gerCountRoleData(search);
		page.setTotal(count);
		return page;
	}

	/**
	 * 获取所有角色，指定组织下
	 * @return
	 */
	public List<Role> findAllRole(String orgId,String keyWord,String filterFlag) {
		return roleDao.findAllList(orgId,keyWord,filterFlag);
	}

	/**
	 * 根据RoleId 获取用户信息
	 * @param user4RoleVO
	 */
	public List<User4RoleVO> getUserByRoleId(User4RoleVO user4RoleVO) {
		return roleDao.getUserByRoleId(new JqGridTablePage(),user4RoleVO);
	}
	/**
	 * 根据RoleId查询在职员工的用户ID
	 * @param roleIds
	 */
	public List<String> getUserIdLsByRoleIdLs(List<String> roleIds) {
		return roleDao.getUserIdLsByRoleIdLs(roleIds);
	}
}