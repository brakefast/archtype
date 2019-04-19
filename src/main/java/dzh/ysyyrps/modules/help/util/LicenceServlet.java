package dzh.ysyyrps.modules.help.util;

import java.io.File;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.ciocem.common.utils.DingTalkUtil;
import dzh.ysyyrps.modules.sys.utils.Global;
import dzh.ysyyrps.modules.sys.utils.SystemInfo;


public class LicenceServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//super.init(config);		
		String filePath = config.getServletContext().getRealPath("") + File.separator + "lic.data";
		String authModuleData = LicenceUtil.resloveData(filePath);
		SystemInfo.setAuthModules(authModuleData);
		DingTalkUtil.setDingTalk(Global.getConfig("dt.id"),Global.getConfig("dt.secret"));
		DingTalkUtil.setDingTalkAppParam(Global.getConfig("dt.appkey"),Global.getConfig("dt.appsecret"),Global.getConfig("dt.agentid"));
	}

}
