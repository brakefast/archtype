/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.utils;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ciocem.common.utils.*;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import dzh.ysyyrps.modules.sys.dao.LogDao;
import dzh.ysyyrps.modules.sys.dao.MenuDao;
import dzh.ysyyrps.modules.sys.entity.Log;
import dzh.ysyyrps.modules.sys.entity.Menu;
import com.ciocem.modules.sys.entity.User;
import dzh.ysyyrps.modules.sys.vo.Menu4LogVO;

/**
 * 字典工具类
 * @author tyluo
 * @version 2014-11-7
 */
public class LogUtils {
	public static final String CACHE_MENU_NAME_PATH_MAP = "menuNamePathMap";
	private static LogDao logDao = SpringContextHolder.getBean(LogDao.class);
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, String title){
		saveLog(request, null, null, title);
	}

	/**
	 * 记下业务异常
	 * @param title
	 * @param exception
     */
	public static void saveBusinessLog(String title,String exception){
		Log log = new Log();
		log.setId(IdGen.uuid());
		log.setTitle(title);
		log.setType("1");
		log.setException(exception);
		logDao.insert(log);
	}
	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, Object handler, Exception ex, String title){
		User user = UserUtils.getUser();
		if (user != null && user.getId() != null){
			Log log = new Log();
			log.setTitle(title);
			log.setType(ex == null ? Log.TYPE_ACCESS : Log.TYPE_EXCEPTION);
			log.setRemoteAddr(StringUtils.getRemoteAddr(request));
			log.setUserAgent(request.getHeader("user-agent"));
			log.setRequestUri(request.getRequestURI());
			log.setParams(request.getParameterMap());
			log.setMethod(request.getMethod());
			// 异步保存日志
			new SaveLogThread(log, handler, ex).start();
		}
	}

	/**
	 * 保存日志线程
	 */
	public static class SaveLogThread extends Thread{
		private Log log;
		private Object handler;
		private Exception ex;
		
		public SaveLogThread(Log log, Object handler, Exception ex){
			super(SaveLogThread.class.getSimpleName());
			this.log = log;
			this.handler = handler;
			this.ex = ex;
		}
		
		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(log.getTitle())){
				String permission = "";
				/**
				 * 尚未使用权限注解，暂时注释掉
				 */
//				if (handler instanceof HandlerMethod){
//					Method m = ((HandlerMethod)handler).getMethod();
//					RequiresPermissions rp = m.getAnnotation(RequiresPermissions.class);
//					permission = (rp != null ? StringUtils.join(rp.value(), ",") : "");
//				}
				log.setTitle(getMenuNamePath(log.getRequestUri(), permission));
			}
			// 如果有异常，设置异常信息
			log.setException(Exceptions.getStackTraceAsString(ex));
			// 如果无标题并无异常日志，则不保存信息
			if (StringUtils.isBlank(log.getTitle()) && StringUtils.isBlank(log.getException())){
				return;
			}
			// 保存日志信息
			log.preInsert(UserUtils.getUser());
			logDao.insert(log);
		}
	}
	
	private static Map<String, String> setMenuPathCache() {
		Map<String, String> menuMap = Maps.newHashMap();
		List<Menu4LogVO> menuList = menuDao.getMenu4Log();
		Map<String,Menu4LogVO> map =  new HashMap<String,Menu4LogVO>();
		for(Menu4LogVO vo :menuList){
			map.put(vo.getId(), vo);
		}
		for(Menu4LogVO vo :menuList){
			if(PubUtil.isEmpty(vo.getHref())){
				continue;
			}
			List<String> namePathList = Lists.newArrayList();
			String parentId = vo.getParentId();
			namePathList.add(vo.getName());
			while (!parentId.equals(Menu.getRootId())){					
				Menu4LogVO tmp = map.get(parentId);
				if (tmp == null){
					parentId = Menu.getRootId();
					continue;
				}
				namePathList.add(tmp.getName());
				parentId = tmp.getParentId();					
			}				
			Collections.reverse(namePathList);
			String namePath = StringUtils.join(namePathList, "-");;
			menuMap.put(vo.getHref(), namePath);
		}
		/*
		List<Menu> menuList = menuDao.findList(new Menu());
		for (Menu menu : menuList){
			// 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
			String namePath = "";
			if (menu.getParentIds() != null){
				List<String> namePathList = Lists.newArrayList();
				for (String id : StringUtils.split(menu.getParentIds(), ",")){
					if (Menu.getRootId().equals(id)){
						continue; // 过滤跟节点
					}
					for (Menu m : menuList){
						if (m.getId().equals(id)){
							namePathList.add(m.getName());
							break;
						}
					}
				}
				namePathList.add(menu.getName());
				namePath = StringUtils.join(namePathList, "-");
			}
			// 设置菜单名称路径
			if (StringUtils.isNotBlank(menu.getHref())){
				menuMap.put(menu.getHref(), namePath);
			}else if (StringUtils.isNotBlank(menu.getPermission())){
				for (String p : StringUtils.split(menu.getPermission())){
					menuMap.put(p, namePath);
				}
			}
		}*/
		CacheUtils.put(CACHE_MENU_NAME_PATH_MAP, menuMap);
		return menuMap;
	}

	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
	public static String getMenuNamePath(String requestUri, String permission){
		//System.out.println("getMenuNamePath-begin:" + System.currentTimeMillis());
		String href = StringUtils.substringAfter(requestUri, Global.getAdminPath());
		@SuppressWarnings("unchecked")
		Map<String, String> menuMap = (Map<String, String>)CacheUtils.get(CACHE_MENU_NAME_PATH_MAP);
		if (menuMap == null){
			synchronized (CACHE_MENU_NAME_PATH_MAP) {
				//System.out.println("setMenuPathCache-begin:" + System.currentTimeMillis());
				menuMap = setMenuPathCache();
				//System.out.println("setMenuPathCache-end:" + System.currentTimeMillis());
			}
		}
		String menuNamePath = menuMap.get(href);
		if (menuNamePath == null && permission != null){
			for (String p : StringUtils.split(permission)){
				menuNamePath = menuMap.get(p);
				if (StringUtils.isNotBlank(menuNamePath)){
					break;
				}
			}
			if (menuNamePath == null){
				return "";
			}
		}
		//System.out.println("getMenuNamePath-end:" + System.currentTimeMillis());
		return menuNamePath;
	}
}
