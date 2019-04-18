package dzh.ysyyrps.modules.hr.vo;

import com.ciocem.common.utils.PubUtil;
import dzh.ysyyrps.modules.hr.entity.EmployeeFiles;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 员工档案VO
 * @author tyluo
 * @version 2016-12-13
 */
public class EmployeeFilesVO extends EmployeeFiles implements Serializable {
	private static final long serialVersionUID = 1L;
	private Date entryDate1;
	private Date entryDate2;
	private Date retireDate1;
	private Date retireDate2;
	private long age;//年龄
	private long enterpriseAge;//企业工龄
	private long socialAge;// 社会工龄
	private String organizationName1;
	private String organizationName2;
	private String keyword;
	private String  provinceName;
	private String cityName;
	private String notEqId;//不等ID
	private String eqNumber;//不等ID
	private String colorFlag;
	private String stationInfoName;//所属岗位名称
	private String filterJobStatus;//过滤离职人员=1
	private String positionInfoName;//职位名称
	private String positionInfoId;//职位
	//用于根据组织查询用户信息
	private String userId;
	private String userName;
	private String loginName;
	private String headImg;
	private String userExistFlag; //档案关联用户  is not null
	private String userKeyword;   //用于 用户条件关联查询
	private String selectedOrganizationId; //选择组织ID
	private List<String> userOrganizationIds;//根据组织 过滤(部门ID)

	private List<String> inUserIds;//属于这个范围的用户
	private String userIds;
	private String treeOrganizationIds;//树多选组织过滤
	private String sendType;//送审类型

	private String currentOrgId;//当前登录组织id

	private List<String> employeeTypes;//员工类型多选集合
	private List<String> jobStatuses;//在职状态多选集合
	private String eqNo;//等于员工编号

	public String getEqNo() {
		return eqNo;
	}

	public void setEqNo(String eqNo) {
		this.eqNo = eqNo;
	}

	public String getCurrentOrgId() {
		return currentOrgId;
	}

	public void setCurrentOrgId(String currentOrgId) {
		this.currentOrgId = currentOrgId;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getTreeOrganizationIds() {
		return treeOrganizationIds;
	}

	public void setTreeOrganizationIds(String treeOrganizationIds) {
		this.treeOrganizationIds = treeOrganizationIds;
	}

	private boolean personalInfo;//工作平台--个人信息页面标签

	public boolean isPersonalInfo() {
		return personalInfo;
	}

	public void setPersonalInfo(boolean personalInfo) {
		this.personalInfo = personalInfo;
	}

	public String getPositionInfoId() {
		return positionInfoId;
	}

	public void setPositionInfoId(String positionInfoId) {
		this.positionInfoId = positionInfoId;
	}

	public String getPositionInfoName() {
		return positionInfoName;
	}

	public void setPositionInfoName(String positionInfoName) {
		this.positionInfoName = positionInfoName;
	}

	/**
	 * 过滤类型
	 * 用看的明白的字符串吧，使用1，2，3，4 看不懂
	 * 取值范围['notmapuser']
	 * 说明：'notmapuser'==>'未对应用户的'
	 */
	private String filterType;
		

    //根据生日获取年龄
	public long getAge() {
		long nowTime = System.currentTimeMillis();
		Date birthday = getBirthday();
		if(PubUtil.isNotEmpty(birthday)){
			long birthTime = birthday.getTime();
			long ageTime = nowTime-birthTime;
			long b=1000;
			long yearTime=60*60*365*b*24;
			return  ageTime/yearTime;
		}
		return 0;
	}

	//根据入职时间获取企业工龄
	public long getEnterpriseAge() {
		long nowTime=System.currentTimeMillis();
		if(PubUtil.isNotEmpty(getEntryDate())){
			long entryTime=getEntryDate().getTime();
			long enterpriseAgeTime=nowTime-entryTime;
			long b=1000;
			long yearTime=60*60*365*b*24;
			return enterpriseAgeTime/yearTime;
		}
		return 0;
	}
	//根据参加工作时间获取社会工龄
	public long getSocialAge() {
		long nowTime=System.currentTimeMillis();
		if(PubUtil.isNotEmpty(getJobDate())){
			long jobTime=getJobDate().getTime();
			long socialAgeTime=nowTime-jobTime;
			long b=1000;
			long yearTime=60*60*365*b*24;
			return socialAgeTime/yearTime;
		}


		return 0;
	}

	public Date getEntryDate1() {
		return entryDate1;
	}
	public void setEntryDate1(Date entryDate1) {
		this.entryDate1 = entryDate1;
	}
	public Date getEntryDate2() {
		return entryDate2;
	}
	public void setEntryDate2(Date entryDate2) {
		this.entryDate2 = entryDate2;
	}
	public Date getRetireDate1() {
		return retireDate1;
	}
	public void setRetireDate1(Date retireDate1) {
		this.retireDate1 = retireDate1;
	}
	public Date getRetireDate2() {
		return retireDate2;
	}
	public void setRetireDate2(Date retireDate2) {
		this.retireDate2 = retireDate2;
	}

	public String getOrganizationName1() {
		return organizationName1;
	}

	public void setOrganizationName1(String organizationName1) {
		this.organizationName1 = organizationName1;
	}

	public String getOrganizationName2() {
		return organizationName2;
	}

	public void setOrganizationName2(String organizationName2) {
		this.organizationName2 = organizationName2;
	}

	public void setAge(long age) {
		this.age = age;
	}

	public void setEnterpriseAge(long enterpriseAge) {
		this.enterpriseAge = enterpriseAge;
	}

	public void setSocialAge(long socialAge) {
		this.socialAge = socialAge;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getNotEqId() {
		return notEqId;
	}

	public void setNotEqId(String notEqId) {
		this.notEqId = notEqId;
	}

	public String getEqNumber() {
		return eqNumber;
	}

	public void setEqNumber(String eqNumber) {
		this.eqNumber = eqNumber;
	}

	public String getColorFlag() {
		return colorFlag;
	}

	public void setColorFlag(String colorFlag) {
		this.colorFlag = colorFlag;
	}

	public String getFilterType() {
		return filterType;
	}

	public void setFilterType(String filterType) {
		this.filterType = filterType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getUserExistFlag() {
		return userExistFlag;
	}

	public void setUserExistFlag(String userExistFlag) {
		this.userExistFlag = userExistFlag;
	}

	public String getUserKeyword() {
		return userKeyword;
	}

	public void setUserKeyword(String userKeyword) {
		this.userKeyword = userKeyword;
	}

	public List<String> getUserOrganizationIds() {
		return userOrganizationIds;
	}

	public void setUserOrganizationIds(List<String> userOrganizationIds) {
		this.userOrganizationIds = userOrganizationIds;
	}

	public String getSelectedOrganizationId() {
		return selectedOrganizationId;
	}

	public void setSelectedOrganizationId(String selectedOrganizationId) {
		this.selectedOrganizationId = selectedOrganizationId;
	}

	public String getStationInfoName() {
		return stationInfoName;
	}

	public void setStationInfoName(String stationInfoName) {
		this.stationInfoName = stationInfoName;
	}

	public String getFilterJobStatus() {
		return filterJobStatus;
	}

	public void setFilterJobStatus(String filterJobStatus) {
		this.filterJobStatus = filterJobStatus;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}


	public List<String> getInUserIds() {
		return inUserIds;
	}

	public void setInUserIds(List<String> inUserIds) {
		this.inUserIds = inUserIds;
	}

	public String getUserIds() {
		return userIds;
	}

	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}

	public List<String> getEmployeeTypes() {
		return employeeTypes;
	}
	public void setEmployeeTypes(List<String> employeeTypes) {
		this.employeeTypes = employeeTypes;
	}

	public List<String> getJobStatuses() {
		return jobStatuses;
	}
	public void setJobStatuses(List<String> jobStatuses) {
		this.jobStatuses = jobStatuses;
	}
}