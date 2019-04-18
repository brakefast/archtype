/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.utils;

import com.ciocem.common.service.BaseService;
import com.ciocem.common.utils.CacheUtils;
import com.ciocem.common.utils.IdGen;
import com.ciocem.common.utils.PubUtil;
import com.ciocem.common.utils.SpringContextHolder;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.hr.dao.EmployeeFilesDao;
import dzh.ysyyrps.modules.hr.dao.OrganizationDao;
import dzh.ysyyrps.modules.hr.entity.EmployeeFiles;
import dzh.ysyyrps.modules.hr.entity.Organization;
import dzh.ysyyrps.modules.sys.dao.*;
import dzh.ysyyrps.modules.sys.entity.*;
import dzh.ysyyrps.modules.sys.security.SystemAuthorizingRealm.Principal;
import dzh.ysyyrps.modules.sys.vo.LoginOrgVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 用户工具类
 * 
 * @author tyluo
 * @version 2013-12-05
 */
public class UserUtils {

	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
	private static RoleDao roleDao = SpringContextHolder.getBean(RoleDao.class);
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);
	private static OfficeDao officeDao = SpringContextHolder.getBean(OfficeDao.class);
	private static OrganizationDao organizationDao = SpringContextHolder.getBean(OrganizationDao.class);
	private static EmployeeFilesDao employeeFilesDao = SpringContextHolder.getBean(EmployeeFilesDao.class);
	private static ModuleManagerDao moduleManagerDao = SpringContextHolder.getBean(ModuleManagerDao.class);

	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";
	/**
	 * 登录错误次数
	 */
	public static final String PREFIX_LOGIN_ERROR_COUNT = "ec_";
	/**
	 * 数据隔离
	 */
	public static final String PREFIX_USER_DATAFILTER = "data_filter_";

	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";

	public static final String ORGANIZATION_CACHE = "organizationCache";
	public static final String ORGANIZATION_CACHE_ID = "id_";

	public static final String EMPLOYEEFILES_CACHE = "employeeFilesCache";
	public static final String EMPLOYEEFILES_CACHE_ID = "id_";

	public static final String AREA_CACHE = "areaCache";
	public static final String AREA_CACHE_ID = "id_";

	public static final String LOGIN_ORG_CACHE = "login_org_";
	private static final String LOGIN_ORG_SESSION_KEY = "login_org_session_key";	
	private static final String LOGIN_TOKEN_SESSION_KEY = "login_token_4_user";
	
	private static final String CURRENT_PROJECT_SESSION_KEY = "current_project_session_key";

	public static final String DJHR_CACHE_ATTENDANCE_BUILD = "djhr_attendance_build";
	
	public static boolean checkIsManager(String moduleKey,String userId) {
		int count = moduleManagerDao.getCountByManager(moduleKey, userId, getLoginOrg());
		return count > 0;
	}

	/**
	 * 组织ID获取组织信息
	 * 
	 * @param id
	 * @return 取不到返回null
	 */
	public static Organization getOrganizationById(String id) {
		Organization organization = (Organization) CacheUtils.get(ORGANIZATION_CACHE, ORGANIZATION_CACHE_ID + id);
		if (organization == null) {
			organization = organizationDao.get(id);
			if (organization == null) {
				return null;
			}
			CacheUtils.put(ORGANIZATION_CACHE, ORGANIZATION_CACHE_ID + organization.getId(), organization);
		}
		return organization;
	}

	/**
	 * 员工档案ID获取员工信息
	 * 
	 * @param id
	 * @return 取不到返回null
	 */
	public static EmployeeFiles getEmployeeFilesById(String id) {
		EmployeeFiles employeeFiles = employeeFilesDao.get(id);
//				(EmployeeFiles) CacheUtils.get(EMPLOYEEFILES_CACHE, EMPLOYEEFILES_CACHE_ID + id);
//		if (employeeFiles == null) {
//			employeeFiles = employeeFilesDao.get(id);
			if (employeeFiles == null) {
				return null;
			}
			CacheUtils.put(EMPLOYEEFILES_CACHE, EMPLOYEEFILES_CACHE_ID + employeeFiles.getId(), employeeFiles);
//		}
		return employeeFiles;
	}

	/**
	 * 不在使用自定义缓存
	 * 
	 * @return
	 */
	public static List<String> getRoleNoList() {
		Principal principal = getPrincipal();
		if (principal != null) {
			return userDao.getRoleNoList(getLoginOrg(), principal.getId());
		}
		return new ArrayList<String>();
	}

	/**
	 * 区域ID获取区域信息
	 * 
	 * @param id
	 * @return 取不到返回null
	 */
	public static Area getAreaById(String id) {
		Area area = (Area) CacheUtils.get(AREA_CACHE, AREA_CACHE_ID + id);
		if (area == null) {
			area = areaDao.get(id);
			if (area == null) {
				return null;
			}
			CacheUtils.put(AREA_CACHE, AREA_CACHE_ID + area.getId(), area);
		}
		return area;
	}

	/**
	 * 根据ID获取用户
	 * 
	 * @param id
	 * @return 取不到返回null
	 */
	public static User get(String id) {
		User user = (User) CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
		if (user == null) {
			user = userDao.get(id);
			if (user == null) {
				return null;
			}
			/* user.setRoleList(roleDao.findList(new Role(user))); */
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}

	/**
	 * 根据登录名获取用户
	 * 
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getByLoginName(String loginName) {
		User user = (User) CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName);
		if (user == null) {
			user = userDao.getByLoginName(new User(null, loginName));
			if (user == null) {
				return null;
			}
			/* user.setRoleList(roleDao.findList(new Role(user))); */
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}

	/**
	 * 清除当前用户缓存
	 */
	public static void clearCache() {
		removeCache(CACHE_ROLE_LIST);
		removeCache(CACHE_MENU_LIST);
		removeCache(CACHE_AREA_LIST);
		removeCache(CACHE_OFFICE_LIST);
		removeCache(CACHE_OFFICE_ALL_LIST);
		UserUtils.clearCache(getUser());
	}

	/**
	 * 清除指定用户缓存
	 * 
	 * @param user
	 */
	public static void clearCache(User user) {
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + user.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName());
	}

	/**
	 * 更新缓存
	 * 
	 * @param user
	 */
	public static void updateCache(User user) {
		CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
		CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
	}

	/**
	 * 获取当前用户
	 * 
	 * @return 取不到返回 new User()
	 */
	public static User getUser() {
		Principal principal = getPrincipal();
		if (principal != null) {
			User user = get(principal.getId());
			if (user != null) {
				return user;
			}
			return new User();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
	}

	/**
	 * 当前数据库
	 * @return
     */
	public static String getDbName() {
		return Global.getConfig("jdbc.type");
	}

	/**
	 * 返回当前用户id
	 * 
	 * @return
	 */
	public static String getCurrentUserId() {
		Principal principal = getPrincipal();
		return (principal == null ? "" : principal.getId());
	}

	/**
	 * 返回当前用户
	 *
	 * @return
	 */
	public static User getCurrentUser() {
		Principal principal = getPrincipal();
		User user = new User();
		String userId =  (principal == null ? "" : principal.getId());
		user.setId(userId);
		return user;
	}

	/**
	 * 获取当前用户角色列表
	 * 
	 * @return
	 */
	public static List<Role> getRoleList() {
		@SuppressWarnings("unchecked")
		List<Role> roleList = (List<Role>) getCache(CACHE_ROLE_LIST);
		if (roleList == null) {
			User user = getUser();
			if (user.getIsSys().equals("1")) {
				/* roleList = roleDao.findAllList(new Role()); */
			} else {
				Role role = new Role();
				role.getSqlMap().put("dsf", BaseService.dataScopeFilter(user.getCurrentUser(), "o", "u"));
				roleList = roleDao.findList(role);
			}
			putCache(CACHE_ROLE_LIST, roleList);
		}
		return roleList;
	}

	/**
	 * 获取当前用户授权菜单
	 * 
	 * @return
	 */
	public static List<Menu> getMenuList() {
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>) getCache(CACHE_MENU_LIST);
		if (!PubUtil.isNotEmptyList(menuList)) {
			// User user = getUser();
			// if (user.isAdmin()){
			menuList = menuDao.findList(new Menu());
			// }else{
			// Menu m = new Menu();
			// m.setUserId(user.getId());
			// menuList = menuDao.findByUserId(m);
			// }
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}

	/**
	 * 获取当前用户授权菜单
	 * 
	 * @return
	 */
	public static Menu getTopMenu() {
		Menu topMenu = new Menu();
		if (getMenuList() != null) {
			topMenu = getMenuList().get(0);
		}
		return topMenu;
	}

	// region user menu
	/**
	 * 获取当前菜单
	 * 
	 * @return
	 */
	@SuppressWarnings("unused")
	public static String getMenus() {
		ServletContext context = SpringContextHolder.getBean(ServletContext.class);
		String userId = getUser().getId();
		String orgId = getLoginOrg();
		List<Menu> menuList = menuDao.findUserMenus(orgId, userId);
		String menuStr = "<li>" + "<div id=\"menuPanelDiv\" class=\"sidebar site-main-nav\">"
				+ "<ul class=\"menuPanelDiv-nav\">";
		List<Menu> l1List = new ArrayList<Menu>();
		List<Menu> l2List = new ArrayList<Menu>();
		List<Menu> l3List = new ArrayList<Menu>();
		if (PubUtil.isNotEmptyList(menuList)) {
			for (Menu menu : menuList) {
				switch (menu.getLevelNum().intValue()) {
				case 1:
					l1List.add(menu);
					break;
				case 2:
					l2List.add(menu);
					break;
				case 3:
					l3List.add(menu);
					break;
				}
			}
		}

		// List<Menu> moduleLs =
		// menuDao.findUserMenus("1",getUser().getId(),"");
		if (PubUtil.isNotEmptyList(l1List)) {
			for (Menu module : l1List) {
				String uuid = IdGen.uuid();
				int subModuleWidth = 1;// 模块宽度
				menuStr += "<li class=\"item-level-1\">" + "<i class=\"fa " + module.getIcon() + "\"></i>" + "<p>"
						+ module.getName() + "</p>" + "<div class=\" submenu\" style=\"min-width: " + uuid + "px;\">";

				List<Menu> subModuleLs = getSubMenuList(l2List, module.getId()); // menuDao.findUserMenus("2",
																					// getUser().getId(),
																					// module.getId());
				if (PubUtil.isNotEmptyList(subModuleLs)) {
					String moduleUUid = IdGen.uuid();
					int maxMenus = 0;// 模块下最多菜单数

					for (Menu subModule : subModuleLs) {// 子模块
						menuStr += "<ul class=\"fl\" style=\"height:" + moduleUUid + "px;\">"
								+ " <li class=\"tit item-level-2\"><p>" + subModule.getName() + "</p></li>";
						List<Menu> menuLs = getSubMenuList(l3List, subModule.getId()); // menuDao.findUserMenus("3",
																						// getUser().getId(),
																						// subModule.getId());
						if (PubUtil.isNotEmptyList(menuLs)) {
							for (Menu menu : menuLs) {
								String hrefStr = "javascript:;";
								if (PubUtil.isNotEmpty(menu.getHref())) {
									if (menu.getHref().startsWith("http://")) {// 如果是互联网资源
										hrefStr = menu.getHref();
									} else if (menu.getHref().endsWith(".html")
											&& !menu.getHref().endsWith("ckfinder.html")) {// 如果是静态资源并且不是ckfinder.html，直接访问不加adminPath
										hrefStr = context.getContextPath() + menu.getHref();
									} else {
										hrefStr = context.getContextPath() + Global.getAdminPath() + menu.getHref();
									}
								}
								menuStr += " <li class=\"item-level-3\" ><a href=\"" + hrefStr + "\"  data-name=\""
										+ menu.getAliasName() + "\" data-no=\"" + menu.getMenuNo() + "\">"
										+ menu.getName() + "</a></li>";
							}
							if (maxMenus < menuLs.size()) {
								maxMenus = menuLs.size();
							}
						}
						menuStr += "</ul>";
					}

					// 高度动态计算（边框分割线）
					int maxHeight = 43 + 33 * maxMenus;
					// menuStr = StringUtils.replace(menuStr, moduleUUid,
					// maxHeight + "");

					menuStr += "</div>" + "</li>";
					subModuleWidth = subModuleLs.size() * 120 + 1;
				}
				// 宽度动态计算
				// menuStr = StringUtils.replace(menuStr, uuid, subModuleWidth +
				// "");
			}
		}

		menuStr += " </ul>" + "</div>" + "</li>";
		return menuStr;
	}


//	/**
//	 * 获取当前菜单
//	 *
//	 * @return
//	 */
//	@SuppressWarnings("unused")
//	public static String getGroupMenus() {
//		ServletContext context = SpringContextHolder.getBean(ServletContext.class);
//		String userId = getUser().getId();
//		String orgId = getLoginOrg();
//		List<Menu> menuList = menuDao.findUserMenus(orgId, userId);
//		String menuStr = "<li class=\"bill-area\">"
//				+ "<div class=\"sideBtn-area\">"
//					+ "<div class=\"sideBtn\" id=\"down-control\">"
//						+ "<i class=\"fa fa-angle-double-up\"></i>"
//					+ "</div>"
//					+ "<div class=\"sideBtn\" id=\"contract\">"
//						+ "<i class=\"fa fa-angle-left\"></i>"
//					+ "</div>"
//					+ "<div class=\"sideBtn\" id=\"up-control\">"
//						+ "<i class=\"fa fa-angle-double-down\"></i>"
//					+ "</div>"
//				+ "</div>"
//				+ "<div id=\"menuPanelDiv\" class=\"sidebar site-main-nav nav-menuTree-area\">"
//				+" <ul class=\"menuTree-area\">";
//		List<Menu> l0List = new ArrayList<Menu>();
//		List<Menu> l1List = new ArrayList<Menu>();
//		List<Menu> l2List = new ArrayList<Menu>();
//		List<Menu> l3List = new ArrayList<Menu>();
//		if (PubUtil.isNotEmptyList(menuList)) {
//			for (Menu menu : menuList) {
//				switch (menu.getLevelNum().intValue()) {
//					case 0:
//						l0List.add(menu);
//						break;
//					case 1:
//						l1List.add(menu);
//						break;
//					case 2:
//						l2List.add(menu);
//						break;
//					case 3:
//
//						l3List.add(menu);
//						break;
//				}
//			}
//		}
//
//		if(PubUtil.isNotEmptyList(l0List)){
//			for(Menu l0 : l0List){
//				menuStr+= "<li class=\"item-level-0\">"
//						   +"<i class=\"fa "+l0.getIcon()+"\"></i><span class=\"fa arrow\"></span><p>"+l0.getName()+"</p>"
//						    +"<ul class=\"menuPanelDiv-nav\">";
//				List<Menu> l1Ls = getSubMenuList(l1List, l0.getId());
//				if(PubUtil.isNotEmptyList(l1List)){
//					for(Menu l1 : l1Ls){
//						menuStr+=" <li class=\"item-level-1\"><p>"+l1.getName()+"</p>"
//								+"<div class=\" submenu\" style=\"height: 43px; display: none; position: absolute; top: 0px; left: 165px; z-index: 2011\">";
//                        List<Menu> l2Ls = getSubMenuList(l2List,l1.getId());
//						if(PubUtil.isNotEmptyList(l2Ls)){
//								for(Menu l2 : l2Ls){
//									menuStr+="<ul class=\"fl\" style=\"height: 288px;\">"
//											+"<li class=\"tit item-level-2\"><p>"+l2.getName()+"</p></li>";
//										List<Menu> l3Ls = getSubMenuList(l3List,l2.getId());
//										if(PubUtil.isNotEmptyList(l3Ls)){
//											for(Menu l3 : l3Ls){
//												menuStr+="<li class=\"item-level-3\"><a href=\""+l3.getHref()+"\" data-name=\""+l3.getAliasName()+"\" data-no=\""+l3.getMenuNo()+"\">"+l3.getName()+"</a></li>";
//											}
//										}
//									menuStr+="</ul>";
//								}
//						}
//						menuStr+="</div>"
//								+"</li>";
//					}
//				}
//				menuStr+="</ul>"
//					      +"</li>";
//			}
//		}
//		menuStr +=  "</ul>" + "</div>";
//		return menuStr;
//	}

	/**
	 * 获取当前菜单
	 *
	 * @return
	 */
	@SuppressWarnings("unused")
	public static String getGroupMenus() {
		ServletContext context = SpringContextHolder.getBean(ServletContext.class);
		String userId = getUser().getId();
		String orgId = getLoginOrg();
		List<Menu> menuList = menuDao.findUserMenus(orgId, userId);
		String menuStr = "";
		List<Menu> l0List = new ArrayList<Menu>();
		List<Menu> l1List = new ArrayList<Menu>();
		List<Menu> l2List = new ArrayList<Menu>();
		List<Menu> l3List = new ArrayList<Menu>();
		if (PubUtil.isNotEmptyList(menuList)) {
			for (Menu menu : menuList) {
				switch (menu.getLevelNum().intValue()) {
					case 0:
						l0List.add(menu);
						break;
					case 1:
						l1List.add(menu);
						break;
					case 2:
						l2List.add(menu);
						break;
					case 3:

						l3List.add(menu);
						break;
				}
			}
		}

		if(PubUtil.isNotEmptyList(l0List)){
			for(Menu l0 : l0List){
				menuStr+= "<ul class=\"sidebar-menu\" id=\""+l0.getId()+"\" data-code=\""+l0.getMenuNo()+"\">";
				menuStr+= "<li class=\"header\">"+l0.getName()+"</li>";
				List<Menu> l1Ls = getSubMenuList(l1List, l0.getId());
				if(PubUtil.isNotEmptyList(l1List)){
					for(Menu l1 : l1Ls){
						menuStr+="<li class=\"treeview\">";
						menuStr+="<a href=\"javascript:void(0)\">";
						menuStr+="<i class=\"fa "+l1.getIcon()+"\"></i> <span>"+l1.getName()+"</span>";
						menuStr+="<i class=\"fa fa-plus pull-right\"></i>";
						menuStr+="</a>";

						menuStr+="<ul class=\"m-TVMenu3\">";
						List<Menu> l2Ls = getSubMenuList(l2List,l1.getId());
						if(PubUtil.isNotEmptyList(l2Ls)){
							for(Menu l2 : l2Ls){
								menuStr+="<li>";
								menuStr+="<a href=\"javascript:void(0)\" >"+l2.getName()+"</a>";
								menuStr+="<ul class=\"m-TVMenu4\">";
								List<Menu> l3Ls = getSubMenuList(l3List,l2.getId());
								if(PubUtil.isNotEmptyList(l3Ls)){
									for(Menu l3 : l3Ls){
										menuStr+="<li><a href=\""+l3.getHref()+"\" data-name=\""+l3.getName()+"\"   data-no=\""+l3.getMenuNo()+"\">"+l3.getName()+"</a></li>";
									}
								}
								menuStr+="</ul>";
							}
						}
						menuStr+="</ul>";
						menuStr+="</li>";
					}
				}
				menuStr+="</ul>";
			}
		}
		menuStr +=  "</ul>";

		System.out.print(menuStr);
		return menuStr;
	}


	/**
	 * 获取直接下级菜单
	 * 
	 * @param sourceList
	 * @param parentId
	 * @return
	 */
	private static List<Menu> getSubMenuList(List<Menu> sourceList, String parentId) {
		List<Menu> subList = new ArrayList<Menu>();
		for (Menu menu : sourceList) {
			if (menu.getParentId().equals(parentId)) {
				subList.add(menu);
			}
		}
		return subList;
	}

	// endregion

	/**
	 * 获取当前用户授权的区域
	 * 
	 * @return
	 */
	public static List<Area> getAreaList() {
		@SuppressWarnings("unchecked")
		List<Area> areaList = (List<Area>) getCache(CACHE_AREA_LIST);
		if (areaList == null) {
			areaList = areaDao.findAllList(new Area());
			putCache(CACHE_AREA_LIST, areaList);
		}
		return areaList;
	}

	/**
	 * 获取当前用户有权限访问的部门
	 * 
	 * @return
	 */
	public static List<Office> getOfficeList() {
		@SuppressWarnings("unchecked")
		List<Office> officeList = (List<Office>) getCache(CACHE_OFFICE_LIST);
		if (officeList == null) {
			User user = getUser();
			if (user.getIsSys().equals("1")) {
				officeList = officeDao.findAllList(new Office());
			} else {
				Office office = new Office();
				office.getSqlMap().put("dsf", BaseService.dataScopeFilter(user, "a", ""));
				officeList = officeDao.findList(office);
			}
			putCache(CACHE_OFFICE_LIST, officeList);
		}
		return officeList;
	}

	/**
	 * 获取当前用户有权限访问的部门
	 * 
	 * @return
	 */
	public static List<Office> getOfficeAllList() {
		@SuppressWarnings("unchecked")
		List<Office> officeList = (List<Office>) getCache(CACHE_OFFICE_ALL_LIST);
		if (officeList == null) {
			officeList = officeDao.findAllList(new Office());
		}
		return officeList;
	}

	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return principal;
			}
		} catch (UnavailableSecurityManagerException e) {

		} catch (InvalidSessionException e) {

		}
		return null;
	}

	public static Session getSession() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null) {
				session = subject.getSession();
			}
			if (session != null) {
				return session;
			}
			// subject.logout();
		} catch (Exception e) {

		}
		return null;
	}

	public static String getSessionId() {
		Session session = getSession();
		if (PubUtil.isNotEmpty(session))
			return (String) session.getId();
		else
			return "";
	}

	// ============== User Cache ==============

	public static Object getCache(String key) {
		return getCache(key, null);
	}

	public static Object getCache(String key, Object defaultValue) {
		// Object obj = getCacheMap().get(key);
		Object obj = getSession().getAttribute(key);
		return obj == null ? defaultValue : obj;
	}

	public static void putCache(String key, Object value) {
		// getCacheMap().put(key, value);
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
		// getCacheMap().remove(key);
		getSession().removeAttribute(key);
	}

	public static String getTime(Date date) {
		StringBuffer time = new StringBuffer();
		Date date2 = new Date();
		long temp = date2.getTime() - date.getTime();
		long days = temp / 1000 / 3600 / 24; // 相差小时数
		if (days > 0) {
			time.append(days + "天");
		}
		long temp1 = temp % (1000 * 3600 * 24);
		long hours = temp1 / 1000 / 3600; // 相差小时数
		if (days > 0 || hours > 0) {
			time.append(hours + "小时");
		}
		long temp2 = temp1 % (1000 * 3600);
		long mins = temp2 / 1000 / 60; // 相差分钟数
		time.append(mins + "分钟");
		return time.toString();
	}

	// 发送注册码
	public static String sendRandomCode(String uid, String pwd, String tel, String randomCode) throws IOException {
		// 发送内容
		// String content = "您的验证码是：" + randomCode + "，有效期30分钟，请在有效期内使用。";

		// return SMSUtils.send(uid, pwd, tel, content);
		return "";// TODO:

	}

	// 注册用户重置密码
	public static String sendPass(String uid, String pwd, String tel, String password) throws IOException {
		// 发送内容
		// String content = "您的新密码是：" + password + "，请登录系统，重新设置密码。";
		// return SMSUtils.send(uid, pwd, tel, content);
		return "";// TODO

	}

	/**
	 * 导出Excel调用,根据姓名转换为ID
	 */
	public static User getByUserName(String name) {
		User u = new User();
		u.setName(name);
		List<User> list = userDao.findList(u);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return new User();
		}
	}

	/**
	 * 导出Excel使用，根据名字转换为id
	 */
	public static Office getByOfficeName(String name) {
		Office o = new Office();
		o.setName(name);
		List<Office> list = officeDao.findList(o);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return new Office();
		}
	}

	/**
	 * 导出Excel使用，根据名字转换为id
	 */
	public static Area getByAreaName(String name) {
		Area a = new Area();
		a.setName(name);
		List<Area> list = areaDao.findList(a);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return new Area();
		}
	}

	// region 登录组织相关

	/**
	 * 获取登录组织缓存key
	 * 
	 * @param userId
	 * @return
	 */
	private static String getLoginOrgCacheKey(String userId) {
		return String.format("%s%s", LOGIN_ORG_CACHE, userId);
	}

	/**
	 * 获取用户登录组织
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<LoginOrgVO> getUserOrgs(String id) {
		List<LoginOrgVO> list = new ArrayList<LoginOrgVO>();
		String key = getLoginOrgCacheKey(id);
		Object object = getCache(key);
		if (PubUtil.isEmpty(object)) {
			list = userDao.getUserOrgs(id);
			putCache(key, list);
		} else {
			list = ((List<LoginOrgVO>) object);
		}
		return list;
	}

	/**
	 * 设置当前登录组织
	 * 
	 * @param orgId
	 */
	public static void setLoginOrg(String orgId) {
		Session session = getSession();
		if (PubUtil.isNotEmpty(session))
			session.setAttribute(LOGIN_ORG_SESSION_KEY, orgId);
	}

	/**
	 * 清除用户登录组织缓存
	 * 
	 * @param userId
	 */
	public static void clearUserLoginOrgCache(String userId) {
		String key = getLoginOrgCacheKey(userId);
		putCache(key, null);
	}

	/**
	 * 获取当前用户所登录的组织
	 * 
	 * @return
	 */
	public static String getLoginOrg() {
		Session session = getSession();
		if (PubUtil.isNotEmpty(session)) {
			Object obj = session.getAttribute(LOGIN_ORG_SESSION_KEY);
			if (PubUtil.isNotEmpty(obj)) {
				return String.valueOf(obj);
			}
			return null;
		} else {
			return null;
		}
	}
	// endregion

	// region 登录token
	public static String getToken4Login() {
		Session session = getSession();
		if (PubUtil.isNotEmpty(session)) {
			Object object = session.getAttribute(LOGIN_TOKEN_SESSION_KEY);
			if (PubUtil.isEmpty(object)) {
				String token = IdGen.uuid();
				session.setAttribute(LOGIN_TOKEN_SESSION_KEY, token);
				return token;
			} else {
				return String.valueOf(object);
			}
		}
		return "";
	}
	// endregion

	// region 登录错误计数
	/**
	 * 获取登录错误计数
	 * 
	 * @param loginName
	 * @return
	 */
	public static int getLogInErrorCount(String loginName) {
		synchronized (loginName) {
			String key = PREFIX_LOGIN_ERROR_COUNT + loginName.toUpperCase();
			Object object = CacheUtils.get(USER_CACHE, key);
			if (object == null) {
				CacheUtils.put(USER_CACHE, key, 0);
				return 0;
			} else {
				return Integer.parseInt(object.toString());
			}
		}
	}

	/**
	 * 添加一次登录错误
	 * 
	 * @param loginName
	 * @return
	 */
	public static int addLogInErrorCount(String loginName) {
		if (PubUtil.isEmpty(loginName)){
			return 1;
		}
		
		synchronized (loginName) {
			String key = PREFIX_LOGIN_ERROR_COUNT + loginName.toUpperCase();
			Object object = CacheUtils.get(USER_CACHE, key);
			if (object == null) {
				CacheUtils.put(USER_CACHE, key, 1);
				return 1;
			} else {
				int count = Integer.parseInt(object.toString()) + 1;
				CacheUtils.put(USER_CACHE, key, count);
				return count;
			}
		}
	}

	/**
	 * 重置/还原
	 * 
	 * @param loginName
	 */
	public static void resetLoginErrorCount(String loginName) {
		String key = PREFIX_LOGIN_ERROR_COUNT + loginName.toUpperCase();
		Object object = CacheUtils.get(USER_CACHE, key);
		if (object != null) {
			CacheUtils.put(USER_CACHE, key, 0);
		}
	}
	// endregion

	// region 锁定/解锁
	/**
	 * 锁定用户
	 * 
	 * @param id
	 */
	public static void lock(String id) {
		userDao.lockUserById(id);
	}

	/**
	 * 解锁用户
	 * 
	 * @param id
	 */
	public static void unLock(String id) {
		userDao.unLockUserById(id);
		User user = get(id);
		resetLoginErrorCount(user.getLoginName());
		clearCache(user);		
	}
	// endregion

	// region
	public static String getUserDataFilter(String id) {
		synchronized (id) {
			String key = PREFIX_USER_DATAFILTER + id;
			Object object = CacheUtils.get(USER_CACHE, key);
			if (object == null) {
				CacheUtils.put(USER_CACHE, key, "");
				return "";
			} else {
				return object.toString();
			}
		}
	}

	public static void setUserDataFilter(String id) {
		synchronized (id) {			
			String key = PREFIX_USER_DATAFILTER + id;
			Object object = CacheUtils.get(USER_CACHE, key);
			if (PubUtil.isEmpty(object)){
				CacheUtils.put(USER_CACHE, key, dataIsolationFilter(id));
			}
		}
	}

	public static void clearUserDataFilter(String id) {
		String key = PREFIX_USER_DATAFILTER + id;
		Object object = CacheUtils.get(USER_CACHE, key);
		if (object != null) {
			CacheUtils.put(USER_CACHE, key, "");
		}
	}
	
	private static String dataIsolationFilter(String id) {
		User user = get(id);
		// 如果是超级管理员，则不过滤数据
		if (PubUtil.isNotEmpty(user.getIsSys()) && user.getIsSys().equals("1")) {
			return "";
		}
		
		StringBuffer sqlFilter = new StringBuffer();
		user.getEmployeeFilesId();		
		String createByFilter = "a.create_by";
		//至少能查看自己的
		sqlFilter.append(String.format(" (%s='%s'", createByFilter, user.getId()));
		//String loginOrg = UserUtils.getLoginOrg();
		sqlFilter.append(" OR EXISTS(")
		.append("	SELECT 1 FROM sys_user WHERE EXISTS(")
		.append("		SELECT 1 FROM hr_employee_files ")
		.append("		WHERE EXISTS(SELECT 1 FROM hr_organization WHERE employee_files_id='%s' AND (id=hr_employee_files.organization_id2 OR id=hr_employee_files.organization_id1)) ")
		.append("		AND id=sys_user.employee_files_id")
		.append("	) AND id= %s")
		.append("))");
		return String.format(sqlFilter.toString(),  user.getEmployeeFilesId(),createByFilter);
	}
	// endregion

	//region 当前项目
	/**
	 * 获取当前项目
	 * @return
	 */
	public static String getCurrentProjectId() {
		Session session = getSession();
		if (PubUtil.isNotEmpty(session)) {
			Object obj = session.getAttribute(CURRENT_PROJECT_SESSION_KEY);
			if (PubUtil.isNotEmpty(obj)) {
				return String.valueOf(obj);
			}
			return null;
		} else {
			return null;
		}
	}
	/**
	 * 设置当前项目
	 * @param projectId
	 */
	public static void setCurrentProjectId(String projectId) {
		Session session = getSession();
		if (PubUtil.isNotEmpty(session))
			session.setAttribute(CURRENT_PROJECT_SESSION_KEY, projectId);
	}


	/**
	 * 获得单据组织名称
	 * 如果表单有组织ID则转义名称
	 * 如果表单组织ID为空，比如新增 则是当前组织名称
	 * @param orgId
	 * @return
     */
	public static String getFormOrg(String orgId){
		if(PubUtil.isNotEmpty(orgId)){
			Organization organization = organizationDao.getVOById(orgId);
			if(PubUtil.isNotEmpty(organization)){
				return organization.getOrganizationName();
			}
			return "";
		}

		String currentOrgId = UserUtils.getLoginOrg();
		if(PubUtil.isNotEmpty(currentOrgId)){
			Organization organization = organizationDao.getVOById(currentOrgId);
			if(PubUtil.isNotEmpty(organization)){
				return organization.getOrganizationName();
			}
		}
		return "";
	}

	/**
	 * 单据所属组织前缀
	 * @return
     */
	public static String getFormOrgLabel(){
		return "组织:";
	}
	//endregion
}
