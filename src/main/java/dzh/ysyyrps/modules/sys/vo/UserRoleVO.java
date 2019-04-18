package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class UserRoleVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String roleName;
	private String roleNo;
	@JsonIgnore
	private String orgId;
	private Boolean havaRole;
	@JsonIgnore
	private String userId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public Boolean getHavaRole() {
		return havaRole;
	}
	public void setHavaRole(Boolean havaRole) {
		this.havaRole = havaRole;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleNo() {
		return roleNo;
	}
	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
	}
	
}
