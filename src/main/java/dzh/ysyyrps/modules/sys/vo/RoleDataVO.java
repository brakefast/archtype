package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

import dzh.ysyyrps.modules.sys.utils.Global;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class RoleDataVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 角色id
	 */
	private String id;
	/**
	 * 角色编号
	 */
	private String roleNo;
	/**
	 * 角色名称
	 */
	private String roleName;
	/**
	 * 角色所属组织
	 */
	@JsonIgnore
	private String orgId;
	
	@JsonIgnore
	private String keyWord;
	/**
	 * 所属组织名称
	 */
	private String orgName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleNo() {
		return roleNo;
	}
	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
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
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	/**
	 * 获取数据库名称
	 */
	@JsonIgnore
	public String getDbName(){
		return Global.getConfig("jdbc.type");
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
}
