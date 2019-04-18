package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


public class RoleData4SaveVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private RoleVO roledata;
	private Map<String, Map<String, List<String>>> otherdata;
	public RoleVO getRoledata() {
		return roledata;
	}
	public void setRoledata(RoleVO roledata) {
		this.roledata = roledata;
	}
	public Map<String, Map<String, List<String>>> getOtherdata() {
		return otherdata;
	}
	public void setOtherdata(Map<String, Map<String, List<String>>> otherdata) {
		this.otherdata = otherdata;
	}
	
	
	
}
