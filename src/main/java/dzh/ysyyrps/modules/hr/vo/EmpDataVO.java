package dzh.ysyyrps.modules.hr.vo;

import java.io.Serializable;

import dzh.ysyyrps.modules.sys.utils.Global;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 
 * @author jkd5170
 *
 */
public class EmpDataVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 组织/部门id 过滤数据用
	private String orgId;
	// 员工编号
	private String empNo;
	// 员工姓名
	private String empName;
	// 员工id
	private String id;
	// 所属部门
	private String deptName;
	// 所属组织
	private String orgName;
	
	//关键字
	private String keyWord;
	
	/**
	 * 获取数据库名称
	 */
	@JsonIgnore
	public String getDbName(){
		return Global.getConfig("jdbc.type");
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
}
