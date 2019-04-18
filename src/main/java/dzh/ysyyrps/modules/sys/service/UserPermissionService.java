package dzh.ysyyrps.modules.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciocem.common.service.CrudService;
import com.ciocem.common.utils.IdGen;
import com.ciocem.common.utils.PubUtil;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.sys.entity.UserPermission;
import dzh.ysyyrps.modules.sys.security.SystemAuthorizingRealm;
import dzh.ysyyrps.modules.sys.security.SystemAuthorizingRealm.Principal;
import dzh.ysyyrps.modules.sys.vo.RightInfoVO;
import dzh.ysyyrps.modules.sys.vo.UserPermissionVO;
import dzh.ysyyrps.modules.sys.dao.UserPermissionDao;

/**
 * 用户授权权限数据Service
 * 
 * @author tyluo
 * @version 2017-04-24
 */
@Service
@Transactional(readOnly = true)
public class UserPermissionService extends CrudService<UserPermissionDao, UserPermission, UserPermissionVO> {
	@Autowired
	private UserPermissionDao userPermissionDao;
	@Autowired
	SystemAuthorizingRealm systemAuthorizingRealm;
	@Autowired
	UserService userService;

	@Autowired
	PermissionService permissionService;

	public int delUserPermission(UserPermissionVO userPermissionVO) {
		return userPermissionDao.delUserPermission(userPermissionVO);
	}

	@Transactional(readOnly = false)
	public void updateUserPermission(UserPermissionVO userPermissionVO) {
		List<UserPermissionVO> userPermissionList_Add = new ArrayList<UserPermissionVO>();
		List<RightInfoVO> right_add_list = permissionService.getPermission4User2Add(userPermissionVO);
		for (RightInfoVO rightInfoVO : right_add_list) {
			UserPermissionVO vo = new UserPermissionVO();
			vo.setOrgId(userPermissionVO.getOrgId());
			vo.setUserId(userPermissionVO.getUserId());
			vo.setRightId(rightInfoVO.getRightId());
			vo.setPermission(rightInfoVO.getPermission());
			vo.setId(IdGen.uuid());
			userPermissionList_Add.add(vo);
		}
		int delCount = delUserPermission(userPermissionVO);
		boolean isAdd = PubUtil.isNotEmptyList(userPermissionList_Add);
		if (isAdd) {
			int addSize = userPermissionList_Add.size();
			int count = addSize / 100;
			for (int i = 0; i <= count; i++) {
				int fromIndex = i * 100;
				int toIndex = (i + 1) * 100;
				if (toIndex >= addSize) {
					toIndex = addSize;
				}
				if (fromIndex == toIndex) {
					return;
				}
				List<UserPermissionVO> subList = userPermissionList_Add.subList(fromIndex, toIndex);
				userPermissionDao.insertUserPermission(subList);
			}

		}
		if (delCount > 0 || isAdd) {
			User user = userService.get(userPermissionVO.getUserId());
			if (PubUtil.isNotEmpty(user)) {
				Principal principal = new Principal(user, false);
				systemAuthorizingRealm.clearCachedAuthorizationInfo(principal);
			}
		}
	}

	public List<String> getUserPermissionList(String orgId, String userId) {
		return userPermissionDao.getUserPermissionList(orgId, userId);
	}
	
	public List<String> getAdminPermissionList() {
		return userPermissionDao.getAdminPermissionList();
	}
}