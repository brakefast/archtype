package dzh.ysyyrps.modules.hr.vo;


import java.io.Serializable;

import dzh.ysyyrps.modules.hr.entity.Organization;

/**
 * 公司内部组织VO
 * @author tyluo
 * @version 2016-12-13
 */
public class OrganizationVO extends Organization implements Serializable {
	private static final long serialVersionUID = 1L;
	private String employeeFilesName;
	private String parentOrganizationName;
	private String notEqId;
	private String judgeCorporationId;
	private String eqNumber;
	private String projectInfoName;//项目
	private String corporateOrganizationName;//所属法人组织
	private String keyword;//关键字

	public String getEmployeeFilesName() {
		return employeeFilesName;
	}
	public void setEmployeeFilesName(String employeeFilesName) {
		this.employeeFilesName = employeeFilesName;
	}

	public String getParentOrganizationName() {
		return parentOrganizationName;
	}

	public void setParentOrganizationName(String parentOrganizationName) {
		this.parentOrganizationName = parentOrganizationName;
	}
	public String getNotEqId() {
		return notEqId;
	}
	public void setNotEqId(String notEqId) {
		this.notEqId = notEqId;
	}
	public String getJudgeCorporationId() {
		return judgeCorporationId;
	}
	public void setJudgeCorporationId(String judgeCorporationId) {
		this.judgeCorporationId = judgeCorporationId;
	}
	public String getEqNumber() {
		return eqNumber;
	}
	public void setEqNumber(String eqNumber) {
		this.eqNumber = eqNumber;
	}

	public String getProjectInfoName() {
		return projectInfoName;
	}

	public void setProjectInfoName(String projectInfoName) {
		this.projectInfoName = projectInfoName;
	}

	public String getCorporateOrganizationName() {
		return corporateOrganizationName;
	}

	public void setCorporateOrganizationName(String corporateOrganizationName) {
		this.corporateOrganizationName = corporateOrganizationName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}