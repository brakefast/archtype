package dzh.ysyyrps.modules.sys.service;

import com.ciocem.common.constant.ExcelConstant;
import com.ciocem.common.constant.SYSConstant;
import com.ciocem.common.dao.Page;
import com.ciocem.common.service.BusinessException;
import com.ciocem.common.service.CrudService;
import com.ciocem.common.utils.CacheUtils;
import com.ciocem.common.utils.PubUtil;
import com.ciocem.common.utils.excel.ImportParam;
import com.ciocem.common.utils.excel.ImportUtil;
import com.ciocem.common.web.BootstrapTablePage;
import com.ciocem.common.web.JqGridTablePage;
import dzh.ysyyrps.modules.base.service.ExcelTemplateService;
import dzh.ysyyrps.modules.sys.dao.UserDao;
import dzh.ysyyrps.modules.sys.entity.Role;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.sys.security.Digests;
import dzh.ysyyrps.modules.sys.utils.Global;
import dzh.ysyyrps.modules.sys.utils.UserUtils;
import dzh.ysyyrps.modules.sys.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 系统用户Service
 * @author tyluo
 * @version 2016-12-14
 */
@Service
@Transactional(readOnly = true)
public class UserService extends CrudService<UserDao, User,UserVO> {
    @Autowired
	private UserDao userDao;
    @Autowired
    private ExcelTemplateService excelTemplateService;


    public static final int SALT_SIZE = 8;
    public static final String HASH_ALGORITHM = "md5";
    public static final int HASH_INTERATIONS = 1024;

    /**
     * 获取Key加载信息
     */
    public static boolean printKeyLoadMessage(){
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n======================================================================\r\n");
        sb.append("\r\n    欢迎使用 "+ Global.getConfig("productName")+" \r\n");
        sb.append("\r\n======================================================================\r\n");
        System.out.println(sb.toString());
        return true;
    }
    /**
     * 获取用户
     * @param id
     * @return
     */
    public User getUser(String id) {
        return UserUtils.get(id);
    }

    /**
     * 根据用户ID查询密码
     * @param userId
     * @return
     */
    public String findPasswordByUserId(String userId){
        return  userDao.findPasswordByUserId(userId);
    }

    //查询全体用户  暂时使用此方法
    public List<User> findAllUser(){
        return userDao.findAllUser();
    }

    /**
     * 根据登录名获取用户
     * @param loginName
     * @return
     */
    public User getUserByLoginName(String loginName) {
        return UserUtils.getByLoginName(loginName);
    }

    public Page<User> findUser(Page<User> page, User user) {
        // 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
        user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
        // 设置分页参数
        user.setPage(page);
        // 执行分页查询
        page.setList(userDao.findList(user));
        return page;
    }

    /**
     * 无分页查询人员列表
     * @param user
     * @return
     */
    public List<User> findUser(User user){
        // 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
        user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
        List<User> list = userDao.findList(user);
        return list;
    }

	/**
	 * 根据当前登录组织查找用户
	 * @param userVO
	 * @return
	 */
	public JqGridTablePage findOrgUserByPage(JqGridTablePage page, UserVO userVO){
		this.preHandlerEntity(userVO);
		page.setRows(userDao.getOrgUserByPage(page,userVO));
		if(page.getPageSize() > 9998) {
			page.setTotal(10000);
		} else {
			page.setTotal(userDao.getTotalOrgUserByPage(userVO));
		}

		return page;
	}

	public BootstrapTablePage findOrgUserByPage(BootstrapTablePage page, UserVO userVO) {
		this.preHandlerEntity(userVO);
		page.setRows(userDao.getOrgUserByPage(page, userVO));
		page.setTotal(userDao.getTotalOrgUserByPage(userVO));
		return page;
	}

	@Transactional(readOnly = false)
    public void updateUserInfo(User user) {
        user.preUpdate(UserUtils.getUser());
        userDao.updateUserInfo(user);
        // 清除用户缓存
        UserUtils.clearCache(user);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
    }

    /**
     * 通过部门ID获取用户列表，仅返回用户id和name（树查询用户时用）
     * @param officeId
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<User> findUserByOfficeId(String officeId) {
        List<User> list = (List<User>) CacheUtils.get(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId);
        if (list == null){
            User user = new User();
            //user.setOffice(new Office(officeId));
            list = userDao.findUserByOfficeId(user);
            CacheUtils.put(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId, list);
        }
        return list;
    }

    @Transactional(readOnly = false)
    public void saveUser(User user) {
        super.save(user);
    }

    @Transactional(readOnly = false)
    public void deleteUser(User user) {
        super.delete(user);
        // 清除用户缓存
        UserUtils.clearCache(user);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
    }

    /*
     * 此处不再处理 loginName，修改密码不允许更改用户名
     */
    @Transactional(readOnly = false)
    public void updatePasswordById(String id, String loginName, String newPassword) {
        User user = userDao.get(id);
        // 清除用户缓存
        UserUtils.clearCache(user);

        user.setPassword(Digests.string2MD5(newPassword));
        //user.setLoginName(loginName);
        userDao.update(user);

        //更新缓存
        //user.setLoginName(loginName);
        UserUtils.updateCache(user);
    }

    @Transactional(readOnly = false)
    public void updateUserLoginInfo(User user) {
        // 保存上次登录信息
        //user.setOldLoginIp(user.getLoginIp());
        //user.setOldLoginDate(user.getLoginDate());
        // 更新本次登录信息
        user.setLoginIp(UserUtils.getSession().getHost());
        user.setLoginDate(new Date());
        userDao.updateLoginInfo(user);
        UserUtils.updateCache(user);
    }

    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    public static String entryptPassword(String plainPassword) {
//        byte[] salt = Digests.generateSalt(SALT_SIZE);
//        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
//        return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
        return Digests.string2MD5(plainPassword);
    }

    /**
     * 验证密码
     * @param plainPassword 明文密码
     * @param password 密文密码
     * @return 验证成功返回true
     */
    public static boolean validatePassword(String plainPassword, String password) {
//        byte[] salt = Encodes.decodeHex(password.substring(0,16));
//        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
//        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
        //return Digests.string2MD5(plainPassword).equals(password);
    	return plainPassword.equals(Digests.string2MD5(password+UserUtils.getToken4Login()));
    }

    @SuppressWarnings("null")
	@Transactional(readOnly = false)
    public Boolean outUserInRole(Role role, User user) {
        List<Role> roles =  null;//user.getRoleList();
        for (Role e : roles){
            if (e.getId().equals(role.getId())){
                roles.remove(e);
                saveUser(user);
                return true;
            }
        }
        return false;
    }

    @Transactional(readOnly = false)
    public User assignUserToRole(Role role, User user) {
        if (user == null){
            return null;
        }
//        List<String> roleIds = user.getRoleIdList();
//        if (roleIds.contains(role.getId())) {
//            return null;
//        }
//        user.getRoleList().add(role);
        saveUser(user);
        return user;
    }

    @SuppressWarnings("unchecked")
	@Transactional(readOnly = false)
    public void importExcel(MultipartFile file){
        try {
            //1、获得导出字段配置参数
            ImportParam importParam = excelTemplateService.getImportParams(ExcelConstant.TEMPLATE_CODE_USER);
            //2、根据配置获得List集合
            List<User> users = ImportUtil.getImportDatas(file,importParam,new User());
            //3、保存到数据库
            if(PubUtil.isNotEmptyList(users)){
                for(User user : users){
                    this.save(user);
                }
            }
        }catch (Exception e){
            throw new BusinessException(SYSConstant.ERROR_MSG);
        }
    }
    
    //region 授权相关
    /**
     * 获取用户树（人力资源树）
     * @param user4TreeVO
     * @return
     */
	public List<User4TreeVO> getUserTreeData(User4TreeVO user4TreeVO) {
		return userDao.getUserTreeData(user4TreeVO);
	}
	
	/**
     * 获取用户树（人力资源树）并制定是否已选
     * @param unSelUser4TreeVO,roleId
     * @return
     */
	public List<UnSelUser4TreeVO> getUnSelUserTreeData(UnSelUser4TreeVO unSelUser4TreeVO,String roleId) {
		return userDao.getUnSelUserTreeData(unSelUser4TreeVO,roleId);
	}
	
	/**
	 * 获取登陆组织以及用户拥有登陆组织
	 * @param org4TreeVO
	 * @return
	 */
	public List<UserOrg4TreeVO> getOrgTreeData(UserOrg4TreeVO org4TreeVO) {		
		return userDao.getOrgTreeData(org4TreeVO);
	}
	/**
	 * 角色列表以及用户所属角色
	 * @param page
	 * @param userRoleVO
	 */
	public void getRoleList(JqGridTablePage page, UserRoleVO userRoleVO) {
		List<UserRoleVO> list = userDao.getRoleList(userRoleVO);
		page.setRows(list);
	}
	/**
	 * 权限树以及用户所拥有权限
	 * @param userRight4TreeVO
	 * @return
	 */
	public List<UserRight4TreeVO> getRightTreeData(UserRight4TreeVO userRight4TreeVO) {
		return userDao.getRightTreeData(userRight4TreeVO);
	}
	public boolean isExists(User user) {
		int count = userDao.getCount(user);
		return (count > 0);
	}
	
	public int insertUserOrgs(String userId,List<UserOrgVO> userOrgs) {
		return userDao.insertUserOrgs(userId, userOrgs);
	}
	
	public int deleteUserOrgs(String userId,List<String> orgIds) {
		return userDao.deleteUserOrgs(userId, orgIds);
	}
    /**
     * 根据角色ID集合查询 用户信息
     * @param userTableVO
     * @return
     */
    public List<UserTableVO> getUserLsByRoleIds(UserTableVO userTableVO){
        return userDao.getUserLsByRoleIds(userTableVO);
    }


    /**
     * 根据角色查询用户进行分页
     * @param page
     * @param userTableVO
     * @return
     */
    public JqGridTablePage findUserRoleTableByPage(JqGridTablePage page, UserTableVO userTableVO) {
        preHandlerEntity(userTableVO);
        page.setRows(userDao.getUserRoleList(userTableVO));
        if (page.getPageSize() > 9998){
            page.setTotal(10000);
        }else {
            if(PubUtil.isNotEmptyList(page.getRows())){
                page.setTotal(page.getRows().size());
            }
        }
        return page;
    }

    /**
     * 根据岗位查询用户进行分页
     * @param page
     * @param userTableVO
     * @return
     */
    public JqGridTablePage getUserStationList(JqGridTablePage page, UserTableVO userTableVO) {
        preHandlerEntity(userTableVO);
        page.setRows(userDao.getUserStationList(userTableVO));
        if(PubUtil.isNotEmptyList(page.getRows())){
            page.setTotal(page.getRows().size());
        }
        return page;
    }

    public JqGridTablePage getUserLsByUserIds(JqGridTablePage page, UserTableVO userTableVO) {
        preHandlerEntity(userTableVO);
        page.setRows(userDao.getUserLsByUserIds(userTableVO));
        if(PubUtil.isNotEmptyList(page.getRows())){
            page.setTotal(page.getRows().size());
        }
        return page;
    }

    //endregion
	
    //region 项目授权
    public void getUserData(JqGridTablePage page, UserDataVO search) {
		List<UserDataVO> list = userDao.getUserData(page, search);
		page.setRows(list);
		int totalRow = userDao.getTotalUserData(search);
		page.setTotal(totalRow);
	}
	
    
    //endregion
    
    //region for app
    public Map<String, String> getUserInfo(String id) {
		return userDao.getUserInfo(id);
	}
    //endregion
	
    /**
     * 根据岗位id获取用户ids
     * @param stationId
     * @return
     */
    public List<String> getUserIdsByStationId(String stationId) {
    	return userDao.getUserIdsByStationId(stationId);		
	}
    
    /**
     * 根据员工id获取用户ids
     * @param id
     * @return
     */
	public List<String> getUserIdByEmpId(String id) {		
		return userDao.getUserIdByEmpId(id);
	}
	/**
	 * 获取用户有权限的项目
	 * @param userId
	 * @param orgId 
	 * @return
	 */
	public List<UserProjectInfoVO> getMyProjectInfos(String userId, String orgId, String keyWord) {
		return userDao.getMyProjectInfos(userId,orgId,keyWord);
	}
	/**
	 * 检测是否有该项目权限
	 * @param userId
	 * @param projectId
	 * @return
	 */
	public boolean haveRight(String userId, String projectId) {
		int count = userDao.getProjectCount(userId, projectId);
		return (count > 0);
	}	
}