package dzh.ysyyrps.modules.sys.vo;

public class UserDataReultVO {
	private boolean success = false;
	private boolean userOrgChanged = false;
	private String userId;
	private String msg;
	public boolean isUserOrgChanged() {
		return userOrgChanged;
	}
	public void setUserOrgChanged(boolean userOrgChanged) {
		this.userOrgChanged = userOrgChanged;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	
}
