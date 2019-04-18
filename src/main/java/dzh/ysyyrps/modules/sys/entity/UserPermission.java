package dzh.ysyyrps.modules.sys.entity;


import com.ciocem.common.dao.DataEntity;

/**
 * 用户授权权限数据Entity
 * @author tyluo
 * @version 2017-04-24
 */
public class UserPermission extends DataEntity<UserPermission> {
	private static final long serialVersionUID = 1L;
	private String permission;		// 权限标识
	private String rightId;		// 权限
	private String userId;		// 用户
	private String orgId;		// 组织
	
	public UserPermission() {
		super();
	}

	public UserPermission(String id){
		super(id);
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	public String getRightId() {
		return rightId;
	}

	public void setRightId(String rightId) {
		this.rightId = rightId;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
}