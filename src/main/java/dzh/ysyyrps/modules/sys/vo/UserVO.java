package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;
import com.ciocem.modules.sys.entity.User;

/**
 * 用户VO
 * 
 * @author tyluo
 * @version 2017-04-25
 */
public class UserVO extends User implements Serializable {
	private static final long serialVersionUID = 1L;

	private String keyword;
	private String eqLoginName;
	private String employeeFilesName; //用户档案名称
	private String org_id;
	private String confirmPassword;
	private String orgId;
	private String employeeFilesNo; //用户档案编号

	private String jobStatus;//是否在职

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getEqLoginName() {
		return eqLoginName;
	}

	public void setEqLoginName(String eqLoginName) {
		this.eqLoginName = eqLoginName;
	}

	public String getEmployeeFilesName() {
		return employeeFilesName;
	}

	public void setEmployeeFilesName(String employeeFilesName) {
		this.employeeFilesName = employeeFilesName;
	}

	public String getOrg_id() {
		return org_id;
	}

	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getEmployeeFilesNo() {
		return employeeFilesNo;
	}

	public void setEmployeeFilesNo(String employeeFilesNo) {
		this.employeeFilesNo = employeeFilesNo;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
}