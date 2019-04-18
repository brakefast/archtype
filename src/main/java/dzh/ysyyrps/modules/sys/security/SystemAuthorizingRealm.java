/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.security;

import com.ciocem.common.mycat.Login;
import com.ciocem.common.utils.MacUtils;
import com.ciocem.common.utils.PubUtil;
import com.ciocem.common.web.Servlets;
import com.ciocem.common.web.ValidateCodeServlet;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.sys.service.UserPermissionService;
import dzh.ysyyrps.modules.sys.service.UserService;
import dzh.ysyyrps.modules.sys.utils.Global;
import dzh.ysyyrps.modules.sys.utils.LogUtils;
import dzh.ysyyrps.modules.sys.utils.UserUtils;
import dzh.ysyyrps.modules.sys.vo.LoginOrgVO;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 系统安全认证实现类
 * 
 * @author tyluo
 * @version 2014-7-5
 */
@Service
public class SystemAuthorizingRealm extends AuthorizingRealm {
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserService userService;
	@Autowired
	UserPermissionService userPermissionService;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private SessionDAO sessionDao;

	/**
	 * 认证回调函数, 登录时调用 身份认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

		int activeSessionSize = sessionDao.getActiveSessions(false).size();
		if (logger.isDebugEnabled()) {
			logger.debug("login submit, active session size: {}, username: {}", activeSessionSize, token.getUsername());
		}
		// boolean mobile = WebUtils.isTrue(request,
		// FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		// // 校验登录验证码
		// if (!mobile &&
		// LoginController.isValidateCodeLogin(token.getUsername(), false,
		// false)) {
		// Session session = UserUtils.getSession();
		// String code = (String)
		// session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
		// if (token.getCaptcha() == null ||
		// !token.getCaptcha().toUpperCase().equals(code)) {
		// throw new AuthenticationException("msg:验证码错误, 请重试.");
		// }
		// }

		//hh

		/* try {
			 logger.info(MacUtils.getMACAddress());
			 logger.error(MacUtils.getMACAddress());
			 System.out.print(MacUtils.getMACAddress());
			 if(!"5E-F3-FC-AE-FD-20".equals(MacUtils.getMACAddress())){
				 throw new AuthenticationException("msg:"+MacUtils.getMACAddress());
			 }
		 }catch (Exception e){
		 	throw new AuthenticationException("msg:");
		 }*/

		//xz
//		try {
//			if(!"18-66-DA-F2-E2-5B".equals(MacUtils.getMACAddress())){
//				throw new AuthenticationException("msg:");
//			}
//		}catch (Exception e){
//			throw new AuthenticationException("msg:");
//		}
		try {
			logger.info("----------------------MAC地址-------------------"+MacUtils.getMACAddress().toString());
		}catch (Exception e){

		}

		if (PubUtil.isNotEmpty(token.getCaptcha())) {
			Session session = UserUtils.getSession();
			Object object = session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
			if (!token.getCaptcha().equalsIgnoreCase(object.toString())) {
				throw new AuthenticationException("msg:验证码错误, 请重试.");
			}
		}
		int count = UserUtils.getLogInErrorCount(token.getUsername());
		if (count > 5) {
			throw new AuthenticationException("msg:账户已被锁定，请联系管理员解锁.");
		}
		if (count > 0 && PubUtil.isEmpty(token.getCaptcha())) {
			throw new AuthenticationException("msg:请输入验证码.");
		}
		if (PubUtil.isNotEmpty(token.getCaptcha())) {
			Session session = UserUtils.getSession();
			Object object = session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
			if (!token.getCaptcha().equalsIgnoreCase(object.toString())) {
				throw new AuthenticationException("msg:验证码错误, 请重试.");
			}
		}

		// 校验用户名密码
		User user = userService.getUserByLoginName(token.getUsername());
		if (user != null) {
			if (user.getLockFlag().equals("1")) {
				throw new AuthenticationException("msg:账户已被锁定，请联系管理员解锁.");
			}
			if (Global.NO.equals(user.getLoginFlag())) {
				throw new AuthenticationException("msg:该帐号已禁止登录.");
			}
			Principal principal = new Principal(user, token.isMobileLogin());
			SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(principal,
					user.getPassword(), getName());
			String isSys = user.getIsSys();
			boolean isAdmin = (PubUtil.isNotEmpty(isSys) && isSys.equals("1"));

			String logOrgId = token.getLoginOrgId();
			boolean logOrgIdEmpty = PubUtil.isEmpty(logOrgId);
			List<String> orgIdList = new ArrayList<String>();
			List<LoginOrgVO> loginOrgList = UserUtils.getUserOrgs(user.getId());
			for (LoginOrgVO loginOrgVO : loginOrgList) {
				orgIdList.add(loginOrgVO.getOrgId());
			}

			int orgSize = loginOrgList.size();
			if (orgSize < 1 ) {
				if (!isAdmin){
					throw new AuthenticationException("msg:该账户不存在登录组织.");
				}
			} else {
				if (!logOrgIdEmpty && !orgIdList.contains(logOrgId)) {
					throw new AuthenticationException("msg:该账户没有所选组织的登录权限，请联系管理员.");
				}
				if (logOrgIdEmpty) {
					logOrgId = user.getLoginOrgId();
					if (PubUtil.isEmpty(logOrgId)) {
						logOrgId = orgIdList.get(0);
					} else {
						if (!orgIdList.contains(logOrgId)) {
							logOrgId = orgIdList.get(0);
						}
					}
				}
			}

			UserUtils.setLoginOrg(logOrgId);
			user.setLoginOrgId(logOrgId);
			userService.updateUserLoginInfo(user);
			LogUtils.saveLog(Servlets.getRequest(), "系统登录");
			UserUtils.setUserDataFilter(user.getId());
			//DingTalkUtil.setDingTalk(Global.getConfig("dt.id"),Global.getConfig("dt.secret"));
			//DingTalkUtil.setDingTalkAppParam(Global.getConfig("dt.appkey"),Global.getConfig("dt.appsecret"),Global.getConfig("dt.agentid"));
			return simpleAuthenticationInfo;
		} else {
			throw new UnknownAccountException("msg:不存在该账户，请检查后重试.");
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用 获取身份信息，包含所属角色、拥有权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Principal principal = (Principal) getAvailablePrincipal(principals);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 添加用户权限信息
		List<String> permissionList = null;
		String sysFlag = principal.getSysFlag();
		if (sysFlag != null && sysFlag.equals("1")) {
			permissionList = userPermissionService.getAdminPermissionList();
		} else {
			permissionList = userPermissionService.getUserPermissionList(UserUtils.getLoginOrg(), principal.getId());
		}
		for (String permission : permissionList) {
			if (PubUtil.isNotEmpty(permission))
				info.addStringPermission(permission);
		}

		// 添加用户角色信息
		for (String roleNo : UserUtils.getRoleNoList()) {
			info.addRole(roleNo);
		}
		return info;
		// 获取当前已登录的用户
		// if (!Global.TRUE.equals(Global.getConfig("user.multiAccountLogin")))
		// {
		// Collection<Session> sessions = sessionDao.getActiveSessions(true,
		// principal, UserUtils.getSession());
		// if (sessions.size() > 0) {
		// // 如果是登录进来的，则踢出已在线用户
		// if (UserUtils.getSubject().isAuthenticated()) {
		// for (Session session : sessions) {
		// sessionDao.delete(session);
		// }
		// }
		// // 记住我进来的，并且当前用户已登录，则退出当前用户提示信息。
		// else {
		// UserUtils.getSubject().logout();
		// throw new AuthenticationException("msg:账号已在其它地方登录，请重新登录。");
		// }
		// }
		// }
		// User user = userService.getUserByLoginName(principal.getLoginName());
		// if (user != null) {
		// SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// //添加用户权限信息
		// List<String> permissionList =
		// userPermissionService.getUserPermissionList(UserUtils.getLoginOrg(),
		// principal.getId());
		// for (String permission : permissionList) {
		// info.addStringPermission(permission);
		// }
		// // 添加用户角色信息
		// for (String roleNo : UserUtils.getRoleNoList()) {
		// info.addRole(roleNo);
		// }
		//
		// // 更新登录IP和时间
		// userService.updateUserLoginInfo(user);
		// // 记录登录日志
		// LogUtils.saveLog(Servlets.getRequest(), "系统登录");
		// return info;
		// }
		// return null;
	}

	@Override
	protected void checkPermission(Permission permission, AuthorizationInfo info) {
		authorizationValidate(permission);
		super.checkPermission(permission, info);
	}

	@Override
	protected boolean[] isPermitted(List<Permission> permissions, AuthorizationInfo info) {
		if (permissions != null && !permissions.isEmpty()) {
			for (Permission permission : permissions) {
				authorizationValidate(permission);
			}
		}
		return super.isPermitted(permissions, info);
	}

	@Override
	public boolean isPermitted(PrincipalCollection principals, Permission permission) {
		authorizationValidate(permission);
		boolean result = super.isPermitted(principals, permission);
		// System.out.println(permission + (result?"--有权限":"--无权限"));
		return result;
	}

	@Override
	protected boolean isPermittedAll(Collection<Permission> permissions, AuthorizationInfo info) {
		if (permissions != null && !permissions.isEmpty()) {
			for (Permission permission : permissions) {
				authorizationValidate(permission);
			}
		}
		return super.isPermittedAll(permissions, info);
	}

	/**
	 * 授权验证方法
	 * 
	 * @param permission
	 */
	private void authorizationValidate(Permission permission) {
		// 模块授权预留接口
	}

	@Override
	protected Object getAuthorizationCacheKey(PrincipalCollection principals) {
		Principal principal = (Principal) getAvailablePrincipal(principals);
		return (principal.getId() + UserUtils.getLoginOrg() + Login.getTenantId());
	}

	/**
	 * 设定密码校验的Hash算法与迭代次数
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		setCredentialsMatcher(new CustomCredentialsMatcher());
	}

	/**
	 * 清空用户关联权限认证，待下次使用时重新加载
	 */
	public void clearCachedAuthorizationInfo(Principal principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 清空所有关联认证
	 * 
	 * @Deprecated 不需要清空，授权缓存保存到session中
	 */
	@Deprecated
	public void clearAllCachedAuthorizationInfo() {
		// Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		// if (cache != null) {
		// for (Object key : cache.keys()) {
		// cache.remove(key);
		// }
		// }
	}

	/**
	 * 授权用户信息
	 */
	public static class Principal implements Serializable {

		private static final long serialVersionUID = 1L;

		private String id; // 编号
		private String loginName; // 登录名
		private String name; // 姓名
		private boolean mobileLogin; // 是否手机登录
		private String sysFlag;

		public Principal(User user, boolean mobileLogin) {
			this.id = user.getId();
			this.loginName = user.getLoginName();
			this.name = user.getName();
			this.mobileLogin = mobileLogin;
			this.sysFlag = user.getIsSys();
		}

		public String getId() {
			return id;
		}

		public String getLoginName() {
			return loginName;
		}

		public String getName() {
			return name;
		}

		public boolean isMobileLogin() {
			return mobileLogin;
		}

		public String getSysFlag() {
			return sysFlag;
		}

		public void setSysFlag(String sysFlag) {
			this.sysFlag = sysFlag;
		}

		// region clearCache modify
		/**
		 * 获取SESSIONID
		 */
		// public String getSessionid() {
		// try {
		// return (String) UserUtils.getSession().getId();
		// } catch (Exception e) {
		// return "";
		// }
		// }
		// endregion

		@Override
		public String toString() {
			return id;
		}

	}
}
