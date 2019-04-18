package dzh.ysyyrps.modules.hr.entity;


import com.ciocem.common.dao.DataEntity;
import com.ciocem.common.utils.excel.ExcelField;

import java.math.BigDecimal;

/**
 * 公司内部组织Entity
 * @author tyluo
 * @version 2016-12-13
 */
public class Organization extends DataEntity<Organization> {
	private static final long serialVersionUID = 1L;
	private String organizationNo;		// 组织编号
	private String organizationName;		// 组织名称
	private String corporationFlag;		// 是否独立法人：0,1
	private String parentOrganizationId;		// 上级组织id
	private String employeeFilesId;		// 负责人
	private String phoneNo;		// 电话
	private String faxNo;		// 传真
	private String email;		// e_mail
	private String address;		// 地址
	private String zipCode;		// 邮政编码
	private Integer sort;		// 序号

	private String taxFlag;     //是否是纳税组织
	private String taxPayerNo;//纳税人登记号
	private String taxPayerType;//纳税人类别
	private String invoiceLimit;//发票限额
	private BigDecimal taxRate;//征收税率
	private BigDecimal addValueTaxRate;//增值税预征率
	private BigDecimal incomeTaxRate;//企业所得税预征率
	private String taxArea;//税务登记地
	private String levyWay; //征收方式

	private String projectInfoId; //项目ID
	private String isProjectOrganization; //是否项目组织
	private String corporateOrganizationId; //所属法人组织
	private String type;//类型  3 客商类型 4 电建集团类型
	private String stateFlag;     //是否启用组织

	public String getStateFlag() {
		return stateFlag;
	}

	public void setStateFlag(String stateFlag) {
		this.stateFlag = stateFlag;
	}

	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}

	public BigDecimal getAddValueTaxRate() {
		return addValueTaxRate;
	}

	public void setAddValueTaxRate(BigDecimal addValueTaxRate) {
		this.addValueTaxRate = addValueTaxRate;
	}

	public BigDecimal getIncomeTaxRate() {
		return incomeTaxRate;
	}

	public void setIncomeTaxRate(BigDecimal incomeTaxRate) {
		this.incomeTaxRate = incomeTaxRate;
	}

	public String getTaxFlag() {
		return taxFlag;
	}

	public void setTaxFlag(String taxFlag) {
		this.taxFlag = taxFlag;
	}

	public String getTaxPayerNo() {
		return taxPayerNo;
	}

	public void setTaxPayerNo(String taxPayerNo) {
		this.taxPayerNo = taxPayerNo;
	}

	public String getTaxPayerType() {
		return taxPayerType;
	}

	public void setTaxPayerType(String taxPayerType) {
		this.taxPayerType = taxPayerType;
	}

	public String getInvoiceLimit() {
		return invoiceLimit;
	}

	public void setInvoiceLimit(String invoiceLimit) {
		this.invoiceLimit = invoiceLimit;
	}



	public String getTaxArea() {
		return taxArea;
	}

	public void setTaxArea(String taxArea) {
		this.taxArea = taxArea;
	}

	public Organization() {
		super();
	}

	public Organization(String id){
		super(id);
	}

	@ExcelField(title="组织编号", align=2, sort=1)
	public String getOrganizationNo() {
		return organizationNo;
	}

	public void setOrganizationNo(String organizationNo) {
		this.organizationNo = organizationNo;
	}
	
	@ExcelField(title="组织名称", align=2, sort=2)
	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	
	@ExcelField(title="是否独立法人：0,1", align=2, sort=3)
	public String getCorporationFlag() {
		return corporationFlag;
	}

	public void setCorporationFlag(String corporationFlag) {
		this.corporationFlag = corporationFlag;
	}
	
	@ExcelField(title="上级组织id", align=2, sort=4)
	public String getParentOrganizationId() {
		return parentOrganizationId;
	}

	public void setParentOrganizationId(String parentOrganizationId) {
		this.parentOrganizationId = parentOrganizationId;
	}
	
	@ExcelField(title="负责人", align=2, sort=5)
	public String getEmployeeFilesId() {
		return employeeFilesId;
	}

	public void setEmployeeFilesId(String employeeFilesId) {
		this.employeeFilesId = employeeFilesId;
	}
	
	@ExcelField(title="电话", align=2, sort=6)
	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	@ExcelField(title="传真", align=2, sort=7)
	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}
	
	@ExcelField(title="e_mail", align=2, sort=8)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@ExcelField(title="地址", align=2, sort=9)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@ExcelField(title="邮政编码", align=2, sort=10)
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getLevyWay() {
		return levyWay;
	}

	public void setLevyWay(String levyWay) {
		this.levyWay = levyWay;
	}

	public String getProjectInfoId() {
		return projectInfoId;
	}

	public void setProjectInfoId(String projectInfoId) {
		this.projectInfoId = projectInfoId;
	}

	public String getIsProjectOrganization() {
		return isProjectOrganization;
	}

	public void setIsProjectOrganization(String isProjectOrganization) {
		this.isProjectOrganization = isProjectOrganization;
	}

	public String getCorporateOrganizationId() {
		return corporateOrganizationId;
	}

	public void setCorporateOrganizationId(String corporateOrganizationId) {
		this.corporateOrganizationId = corporateOrganizationId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}