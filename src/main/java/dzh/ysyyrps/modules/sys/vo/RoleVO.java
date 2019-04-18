package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;
import java.util.List;

import dzh.ysyyrps.modules.sys.entity.Role;

/**
 * 角色VO
 * @author tyluo
 * @version 2017-04-25
 */
public class RoleVO extends Role implements Serializable {
     private static final long serialVersionUID = 1L;
	
     private String keyword;
     private String orgName;
	 private List<String> roleIdLs;//角色ID集合

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<String> getRoleIdLs() {
		return roleIdLs;
	}

	public void setRoleIdLs(List<String> roleIdLs) {
		this.roleIdLs = roleIdLs;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	
}