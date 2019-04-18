package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

public class LoginOrgVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String orgId;
	private String orgName;
	private String orgNo;
	private String parentOrgId;
		
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
	public String getOrgNo() {
		return orgNo;
	}
	public void setOrgNo(String orgNo) {
		this.orgNo = orgNo;
	}

	public String getParentOrgId() {
		return parentOrgId;
	}
	public void setParentOrgId(String parentOrgId) {
		this.parentOrgId = parentOrgId;
	}
}
