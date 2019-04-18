package dzh.ysyyrps.modules.sys.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciocem.common.constant.SYSConstant;
import com.ciocem.common.service.CrudService;
import com.ciocem.common.utils.IdGen;
import com.ciocem.common.utils.MyBeanUtils;
import com.ciocem.common.utils.PubUtil;
import dzh.ysyyrps.modules.sys.entity.Permission;
import dzh.ysyyrps.modules.sys.entity.Role;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.sys.security.SessionDAO;
import dzh.ysyyrps.modules.sys.security.SystemAuthorizingRealm.Principal;
import dzh.ysyyrps.modules.sys.utils.UserUtils;
import dzh.ysyyrps.modules.sys.vo.PermissionVO;
import dzh.ysyyrps.modules.sys.vo.RightInfoVO;
import dzh.ysyyrps.modules.sys.vo.RightPermissionVO;
import dzh.ysyyrps.modules.sys.vo.RoleData4SaveVO;
import dzh.ysyyrps.modules.sys.vo.RoleDataResultVO;
import dzh.ysyyrps.modules.sys.vo.RoleUserVO;
import dzh.ysyyrps.modules.sys.vo.RoleVO;
import dzh.ysyyrps.modules.sys.vo.UserData4SaveVO;
import dzh.ysyyrps.modules.sys.vo.UserDataReultVO;
import dzh.ysyyrps.modules.sys.vo.UserOrgVO;
import dzh.ysyyrps.modules.sys.vo.UserPermissionVO;
import dzh.ysyyrps.modules.sys.vo.UserVO;
import dzh.ysyyrps.modules.sys.dao.PermissionDao;

/**
 * 授权权限表Service
 * 
 * @author tyluo
 * @version 2017-04-25
 */
@Service
@Transactional(readOnly = true)
public class PermissionService extends CrudService<PermissionDao, Permission, PermissionVO> {
	@Autowired
	private PermissionDao permissionDao;
	@Autowired
	RoleService roleService;
	@Autowired
	UserService userService;
	@Autowired
	UserPermissionService userPermissionService;
	@Autowired
	SessionDAO sessionDAO;
	
	private final static int SQL_PARAM_COUNT_MAX = 10;
	/**
	 * 批量提交记录数
	 */
	private final static int BATCH_INSERT_COUNT = 300;

	@Transactional(readOnly = false)
	public UserDataReultVO saveUserData(UserData4SaveVO userData4SaveVO, String orgId) {
		UserDataReultVO result = new UserDataReultVO();
		UserVO userVO = userData4SaveVO.getUserdata();
		boolean canSave = true;
		boolean permissionChanged = false;
		String id = userVO.getId();
		if (PubUtil.isNotEmpty(userVO.getLoginName())) {
			User user = new User();
			user.setLoginName(userVO.getLoginName());
			user.setId(id);
			if (userService.isExists(user)) {
				canSave = false;
				result.setMsg(SYSConstant.USER_LOGINNAME_EXISTSED);
				return result;
			}
		}
		if (PubUtil.isEmpty(id)) {
			if (PubUtil.isEmpty(userVO.getLoginName())) {
				canSave = false;
				result.setMsg(SYSConstant.USER_LOGINNAME_NULL);
				return result;
			}
			if (PubUtil.isEmpty(userVO.getName())) {
				canSave = false;
				result.setMsg(SYSConstant.USER_NAME_NULL);
				return result;
			}
			if (PubUtil.isEmpty(userVO.getEmployeeFilesId())) {
				canSave = false;
				result.setMsg(SYSConstant.USER_EMP_NULL);
				return result;
			}
			String pwd = userVO.getPassword();
			if (PubUtil.isEmpty(pwd)) {
				pwd = SYSConstant.DEFAULT_PWD;
				userVO.setPassword(UserService.entryptPassword(pwd));
			}
		}
		// else {
		// String pwd = userVO.getPassword();
		// if (PubUtil.isNotEmpty(pwd)) {
		// userVO.setPassword(UserService.entryptPassword(pwd));
		// }
		// }
		if (canSave) {			
			if (PubUtil.isNotEmpty(id)) {
				if (PubUtil.isNotEmpty(userVO.getLoginName()) || PubUtil.isNotEmpty(userVO.getName())
						|| PubUtil.isNotEmpty(userVO.getEmployeeFilesId())
						|| PubUtil.isNotEmpty(userVO.getPassword())) {
					User entity = userService.get(id);
					//如果当前所对应员工与原对应员工不一致，视为变更对应员工，相应权限需要更新
					if (PubUtil.isNotEmpty(userVO.getEmployeeFilesId()) && !userVO.getEmployeeFilesId().equals(entity.getEmployeeFilesId())){
						permissionChanged = true;
					}
					MyBeanUtils.copyBeanNotNull2Bean(userVO, entity);
					userService.save(entity);
					UserUtils.clearCache(entity);
					Principal principal = new Principal(entity, false);
					Collection<Session> sessions = sessionDAO.getActiveSessions(true, principal, null);
					if (sessions.size() > 0){
						for (Session session : sessions){
							sessionDAO.delete(session);
						}
					}
				}
			} else {
				userVO.setLoginFlag("1");
				userVO.setIsSys("0");
				id = userService.saveOrUpdate(userVO);
			}
			Map<String, Map<String, List<String>>> map = userData4SaveVO.getOtherdata();
			// right TODO 应当修改为批量插入
			Map<String, List<String>> tmpData = map.get("rightdata");
			List<String> rightAddList = tmpData.get("add");
			if (PubUtil.isNotEmptyList(rightAddList)) {
				permissionChanged = true;				
				List<Permission> permissions = new  ArrayList<Permission>();				
				for (String rightId : rightAddList) {
					Permission permission = new Permission();
					permission.setId(IdGen.uuid());
					permission.setBustype(SYSConstant.PERMISSION_BUSTYPE_USER);
					permission.setBusid(id);
					permission.setOrgId(orgId);
					permission.setRightId(rightId);
					//this.save(permission);					
					permissions.add(permission);
				}
				int size = permissions.size();
				if (size > BATCH_INSERT_COUNT){										
					int count = size / BATCH_INSERT_COUNT;
					for (int i = 0; i <= count; i++) {
						int fromIndex = i * BATCH_INSERT_COUNT;
						int toIndex = (i + 1) * BATCH_INSERT_COUNT;
						if (toIndex >= size) {
							toIndex = size;
						}
						if (fromIndex != toIndex) {
							permissionDao.saveRights(permissions.subList(fromIndex, toIndex));
						}
					}
				}else {
					permissionDao.saveRights(permissions);					
				}
			}

			List<String> rightDelList = tmpData.get("del");
			if (PubUtil.isNotEmptyList(rightDelList)) {
				permissionChanged = true;				
				deleteByOther(SYSConstant.PERMISSION_BUSTYPE_USER, id, orgId, rightDelList);
			}

			// user
			tmpData = map.get("roledata");
			List<String> roleAddList = tmpData.get("add");

			if (PubUtil.isNotEmptyList(roleAddList)) {
				permissionChanged = true;
				List<RoleUserVO> roleUserVOs = new ArrayList<RoleUserVO>();
				for (String roleId : roleAddList) {
					RoleUserVO vo = new RoleUserVO();
					vo.setId(IdGen.uuid());
					vo.setRoleId(roleId);
					vo.setUserId(id);
					vo.setOrgId(orgId);
					roleUserVOs.add(vo);
				}
				if (roleUserVOs.size() > 0) {
					roleService.insertRoleUsers(roleUserVOs);
				}
			}

			List<String> roleDelList = tmpData.get("del");
			if (PubUtil.isNotEmptyList(roleDelList)) {
				permissionChanged = true;
				roleService.deleteRoleUsers(orgId, "role", roleDelList, id);
			}
			// orgdata
			tmpData = map.get("orgdata");
			List<UserOrgVO> list = new ArrayList<UserOrgVO>();
			List<String> orgAddList = tmpData.get("add");
			for (String orgTmpId : orgAddList) {
				UserOrgVO vo = new UserOrgVO();
				vo.setId(IdGen.uuid());
				vo.setOrgId(orgTmpId);
				list.add(vo);
			}
			if (list.size() > 0) {
				userService.insertUserOrgs(id, list);
				result.setUserOrgChanged(true);
			}

			List<String> orgDelList = tmpData.get("del");
			if (PubUtil.isNotEmptyList(orgDelList)) {
				userService.deleteUserOrgs(id, orgDelList);
				result.setUserOrgChanged(true);
			}
			result.setUserId(id);
		}
		result.setSuccess(true);
		// 更新用户权限
		if (permissionChanged) {
			UserPermissionVO vo = new UserPermissionVO();
			vo.setUserId(id);
			vo.setOrgId(orgId);
			userPermissionService.updateUserPermission(vo);
		}
		return result;
	}

	@Transactional(readOnly = false)
	public RoleDataResultVO saveRoleData(RoleData4SaveVO roleData4SaveVO, String orgId) {
		RoleDataResultVO result = new RoleDataResultVO();
		boolean isNeedUpdatePermission = false;
		RoleVO roleVO = roleData4SaveVO.getRoledata();
		roleVO.setOrgId(orgId);
		roleVO.setUseable("1");
		roleVO.setDelFlag("0");
		boolean canSave = true;
		String id = roleVO.getId();
		if (PubUtil.isNotEmpty(roleVO.getNo())) {
			Role role = new Role();
			role.setNo(roleVO.getNo());
			role.setOrgId(orgId);
			if (roleService.isExists(role)) {
				canSave = false;
				result.setMsg(SYSConstant.ROLE_NO_EXISTSED);
				return result;
			}
		}
		if (PubUtil.isEmpty(id)) {
			if (PubUtil.isEmpty(roleVO.getNo())) {
				canSave = false;
				result.setMsg(SYSConstant.ROLE_NO_NULL);
				return result;
			}
			if (PubUtil.isEmpty(roleVO.getName())) {
				canSave = false;
				result.setMsg(SYSConstant.ROLE_NAME_NULL);
				return result;
			}
			
		}
		
		if(PubUtil.isNotEmpty(roleVO.getName())){
			Role role = new Role();
			role.setId(id);
			role.setName(roleVO.getName());
			role.setOrgId(orgId);
			if (roleService.isExists(role)) {
				canSave = false;
				result.setMsg(SYSConstant.ROLE_NAME_EXISTSED);
				return result;
			}
		}
		
		List<String> userIdList = new ArrayList<String>();
		if (canSave) {
			boolean isAdd = false;
			if (PubUtil.isNotEmpty(id)) {
				if (PubUtil.isNotEmpty(roleVO.getNo()) || PubUtil.isNotEmpty(roleVO.getName())) {
					Role entity = roleService.get(id);
					MyBeanUtils.copyBeanNotNull2Bean(roleVO, entity);
					roleService.save(entity);
				}
			} else {
				id = roleService.saveOrUpdate(roleVO);
				isAdd = true;
			}
			Map<String, Map<String, List<String>>> map = roleData4SaveVO.getOtherdata();
			// right TODO 应当修改为批量插入
			boolean right_modified = false;
			Map<String, List<String>> tmpData = map.get("rightdata");
			List<String> rightAddList = tmpData.get("add");
			if (PubUtil.isNotEmptyList(rightAddList)) {
				right_modified = true;
				List<Permission> permissions = new  ArrayList<Permission>();
				for (String rightId : rightAddList) {
					Permission permission = new Permission();
					permission.setId(IdGen.uuid());
					permission.setBustype(SYSConstant.PERMISSION_BUSTYPE_ROLE);
					permission.setBusid(id);
					permission.setOrgId(orgId);
					permission.setRightId(rightId);
					//this.save(permission);
					permissions.add(permission);
				}
				
				int size = permissions.size();
				if (size > BATCH_INSERT_COUNT){										
					int count = size / BATCH_INSERT_COUNT;
					for (int i = 0; i <= count; i++) {
						int fromIndex = i * BATCH_INSERT_COUNT;
						int toIndex = (i + 1) * BATCH_INSERT_COUNT;
						if (toIndex >= size) {
							toIndex = size;
						}
						if (fromIndex != toIndex) {
							permissionDao.saveRights(permissions.subList(fromIndex, toIndex));
						}
					}
				}else {
					permissionDao.saveRights(permissions);					
				}				
			}
			List<String> rightDelList = tmpData.get("del");
			if (PubUtil.isNotEmptyList(rightDelList)) {
				deleteByOther(SYSConstant.PERMISSION_BUSTYPE_ROLE, id, orgId, rightDelList);
				right_modified = true;
			}
			if (right_modified && !isAdd) {
				//增加角色对应岗位，对应员工所对应的用户
				List<String> roleUserIds = roleService.getUserIdsByRoleId(id, orgId);
				userIdList.addAll(roleUserIds);				
			}
			isNeedUpdatePermission = right_modified;
			// user
			tmpData = map.get("userdata");
			List<RoleUserVO> roleUserVOs = new ArrayList<RoleUserVO>();
			List<String> userAddList = tmpData.get("add");
			for (String userId : userAddList) {
				RoleUserVO vo = new RoleUserVO();
				vo.setId(IdGen.uuid());
				vo.setOrgId(orgId);
				vo.setRoleId(id);
				vo.setUserId(userId);
				roleUserVOs.add(vo);
				userIdList.add(userId);
			}
			if (roleUserVOs.size() > 0) {
				isNeedUpdatePermission = true;
				int addSize = roleUserVOs.size();
				int count = addSize / 100;
				for (int i = 0; i <= count; i++) {
					int fromIndex = i * 100;
					int toIndex = (i + 1) * 100;
					if (toIndex >= addSize) {
						toIndex = addSize;
					}
					if (fromIndex == toIndex) {
						break;
					}
					List<RoleUserVO> subList = roleUserVOs.subList(fromIndex, toIndex);
					roleService.insertRoleUsers(subList);
				}
			}
			List<String> userDelList = tmpData.get("del");
			if (PubUtil.isNotEmptyList(userDelList)) {
				isNeedUpdatePermission = true;
				roleService.deleteRoleUsers(orgId, "", userDelList, id);
				//if (right_modified) {
					userIdList.addAll(userDelList);
				//}
			}
		}
		result.setSuccess(true);
		result.setUserIdList(userIdList);
		if (isNeedUpdatePermission) {
			for (String userId : userIdList) {
				UserPermissionVO vo = new UserPermissionVO();
				vo.setUserId(userId);
				vo.setOrgId(UserUtils.getLoginOrg());
				userPermissionService.updateUserPermission(vo);
			}
		}
		return result;

	}

	public List<RightInfoVO> getPermission4User2Add(UserPermissionVO userPermissionVO) {
		return permissionDao.getPermission4User2Add(userPermissionVO);
	}

	public List<RightPermissionVO> findAllRight() {
		return permissionDao.findAllRight();
	}
	
	private void deleteByOther(String busType, String busId, String orgId, List<String> rightIds) {
		List<List<String>> deLists = new ArrayList<List<String>>();
		int delCount = rightIds.size();
		if (delCount > SQL_PARAM_COUNT_MAX){
			int count = delCount/SQL_PARAM_COUNT_MAX;
			if (delCount % SQL_PARAM_COUNT_MAX > 0){
				count +=1;
			}
			for(int i=0; i< count; i++){
				int start = i*SQL_PARAM_COUNT_MAX;
				int end = (i+1)*SQL_PARAM_COUNT_MAX;
				if (end > delCount){
					end = delCount;
				}
				deLists.add(rightIds.subList(start,end ));
			}
		}else{
			deLists.add(rightIds);
		}
		for (List<String> list : deLists) {
			permissionDao.deleteByEach(busType, busId, orgId, list);
		}
		
	}
}