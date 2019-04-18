package dzh.ysyyrps.modules.sys.security;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.config.IniFilterChainResolverFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dzh.ysyyrps.modules.sys.service.PermissionService;
import dzh.ysyyrps.modules.sys.utils.Global;
import dzh.ysyyrps.modules.sys.vo.RightPermissionVO;

@Service
public class ShiroPermissionFactory extends ShiroFilterFactoryBean {
	
	//private static final String RIGHT_CACHE_KEY = "right_cache_key";
	
	@Autowired
	PermissionService permissionService;
	
	/**
	 * 
	 * 记录配置文件过滤链
	 */
	public static String definition = "";

	@Override
	public void setFilterChainDefinitions(String definitions) {
		//System.out.println("setFilterChainDefinitions:" + System.currentTimeMillis());
		definition = definitions;		
		List<RightPermissionVO> permissions = permissionService.findAllRight();
		LinkedHashMap<String, String> otherChains = new LinkedHashMap<String, String>();
		String adminPath = Global.getAdminPath();
		for (RightPermissionVO rightPermissionVO : permissions) {
			String url = rightPermissionVO.getPermissionUrl();			
			url = String.format(url.startsWith("/") ? "%s%s" : "%s/%s", adminPath, url);
			String permission = String.format("perms[%s]", rightPermissionVO.getPermission());
			otherChains.put(url, permission);
		}
		otherChains.put(String.format("%s/**", adminPath), "user");
		// 加载配置默认的过滤链
		Ini ini = new Ini();
		ini.load(definitions);
		Ini.Section section = ini.getSection(IniFilterChainResolverFactory.URLS);
		if (CollectionUtils.isEmpty(section)) {
			section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		}
		// 加上数据库中过滤链
		section.putAll(otherChains);
		setFilterChainDefinitionMap(section);
		//System.out.println("setFilterChainDefinitions-end:" + System.currentTimeMillis());
	}
	
	/**
	 * 清除权限缓存
	 */
	public static void clearRightCahce() {
		//EhCacheUtils.put(RIGHT_CACHE_KEY, null);
	}
}
