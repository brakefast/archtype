package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class UserData4SaveVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserVO userdata;
	private Map<String, Map<String, List<String>>> otherdata;
	public UserVO getUserdata() {
		return userdata;
	}
	public void setUserdata(UserVO userdata) {
		this.userdata = userdata;
	}
	public Map<String, Map<String, List<String>>> getOtherdata() {
		return otherdata;
	}
	public void setOtherdata(Map<String, Map<String, List<String>>> otherdata) {
		this.otherdata = otherdata;
	}
	

}
