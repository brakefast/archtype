/**
 * 
 */
package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

import dzh.ysyyrps.modules.sys.entity.Log;

/**
 * @author Ethan
 * LogVO查询条件、查询结果容器
 */
public class LogVO extends Log implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String createById;
	private String createByName;
	private String createByCompanyName;
	private String createByOfficeName;
	private String beginDate;
	private String endDate;

	private String employeeFileName;//员工档案名称
	private String companyName;//公司
	private String officeName;//部门

	
	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCreateById() {
		return createById;
	}

	public void setCreateById(String createById) {
		this.createById = createById;
	}

	public String getCreateByName() {
		return createByName;
	}

	public void setCreateByName(String createByName) {
		this.createByName = createByName;
	}

	public String getCreateByCompanyName() {
		return createByCompanyName;
	}

	public void setCreateByCompanyName(String createByCompanyName) {
		this.createByCompanyName = createByCompanyName;
	}

	public String getCreateByOfficeName() {
		return createByOfficeName;
	}

	public void setCreateByOfficeName(String createByOfficeName) {
		this.createByOfficeName = createByOfficeName;
	}

	public String getEmployeeFileName() {
		return employeeFileName;
	}

	public void setEmployeeFileName(String employeeFileName) {
		this.employeeFileName = employeeFileName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
}
