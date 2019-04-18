package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

/**
 * 权限基本信息
 * @author jkd5170
 *
 */
public class RightInfoVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String rightId; //权限id
	private String permission;//权限标识
	public String getRightId() {
		return rightId;
	}
	public void setRightId(String rightId) {
		this.rightId = rightId;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	

}
