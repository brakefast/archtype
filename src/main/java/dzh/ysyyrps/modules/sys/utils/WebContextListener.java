package dzh.ysyyrps.modules.sys.utils;


import dzh.ysyyrps.modules.sys.service.UserService;
import org.springframework.web.context.WebApplicationContext;


import javax.servlet.ServletContext;

public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {

	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!UserService.printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}
}
