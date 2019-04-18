package dzh.ysyyrps.modules.hr.vo;
import java.io.Serializable;
import java.util.List;

/**
 * Created by user on 2018/10/12.
 */
public class EmployeeFilesForDjhrVO  implements Serializable {
    private static final long serialVersionUID = 1L;
    /***
     * 组织或部门列表
     */
    private List<String> orgLs;
    /**
     * 员工类型
     */
    private List<String> employeeTypeLs;
    /**
     * 工作状态
     */
    private List<String> jobStatusLs;
    /**
     * 年度
     */
    private Integer year;
    /**
     * 月份
     */
    private Integer month;
    /***
     * 计算的所属年度
     */
    private Integer countYear;
    /**
     * 计算的模块类型
     */
    private String  moduleType;
    /**
     * 员工档案id
     */
    private String id ;
    /**
     * 员工档案名称
     */
    private String employeeName ;
    /**
     * 员工工号
     */
    private String employeeNo ;
    /**
     * 组织Id
     */
    private String organizationId1 ;
    /**
     * 组织名称
     */
    private String organizationName1 ;
    /**
     * 部门Id
     */
    private String organizationId2 ;
    /**
     * 部门名称
     */
    private String organizationName2 ;
    /**
     * 该员工是否已经计算过
     */
    private String markFlag ;
    /**
     * 部门Id列表数据 string形式 （aaaa,bbbb）
     */
    private String orgLsString ;

    public List<String> getEmployeeTypeLs() {
        return employeeTypeLs;
    }

    public void setEmployeeTypeLs(List<String> employeeTypeLs) {
        this.employeeTypeLs = employeeTypeLs;
    }

    public List<String> getJobStatusLs() {
        return jobStatusLs;
    }

    public void setJobStatusLs(List<String> jobStatusLs) {
        this.jobStatusLs = jobStatusLs;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public String getModuleType() {
        return moduleType;
    }

    public void setModuleType(String moduleType) {
        this.moduleType = moduleType;
    }

    public List<String> getOrgLs() {
        return orgLs;
    }

    public void setOrgLs(List<String> orgLs) {
        this.orgLs = orgLs;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getOrganizationId1() {
        return organizationId1;
    }

    public void setOrganizationId1(String organizationId1) {
        this.organizationId1 = organizationId1;
    }

    public String getOrganizationName1() {
        return organizationName1;
    }

    public void setOrganizationName1(String organizationName1) {
        this.organizationName1 = organizationName1;
    }

    public String getOrganizationId2() {
        return organizationId2;
    }

    public void setOrganizationId2(String organizationId2) {
        this.organizationId2 = organizationId2;
    }

    public String getOrganizationName2() {
        return organizationName2;
    }

    public void setOrganizationName2(String organizationName2) {
        this.organizationName2 = organizationName2;
    }

    public String getMarkFlag() {
        return markFlag;
    }

    public void setMarkFlag(String markFlag) {
        this.markFlag = markFlag;
    }

    public String getEmployeeNo() {
        return employeeNo;
    }

    public void setEmployeeNo(String employeeNo) {
        this.employeeNo = employeeNo;
    }

    public Integer getCountYear() {
        return countYear;
    }

    public void setCountYear(Integer countYear) {
        this.countYear = countYear;
    }

    public String getOrgLsString() {
        return orgLsString;
    }

    public void setOrgLsString(String orgLsString) {
        this.orgLsString = orgLsString;
    }
}
