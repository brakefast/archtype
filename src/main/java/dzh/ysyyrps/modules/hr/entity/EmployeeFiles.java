package dzh.ysyyrps.modules.hr.entity;

import com.ciocem.common.dao.DataEntity;
import com.ciocem.common.utils.excel.ExcelField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 员工档案Entity
 *
 * @author tyluo
 * @version 2016-12-22
 */
public class EmployeeFiles extends DataEntity<EmployeeFiles> {
    private static final long serialVersionUID = 1L;
    private String employeeNo;        // 员工编码
    private String employeeName;        // 员工姓名
    private String employeeBeforeName;        // 曾用名
    private String sexNo;        // 性别
    private String organizationId1;        // 法人组织id
    private String organizationId2;        // 部门id
    private String employeeType;        // 员工类型
    private String credentialsType;        // 证件类型
    private String credentialsNo;        // 证件编号
    private Date entryDate;        // 入职时间
    private String jobTitle;        // 职称
    private String jobPost;        // 职务
    private Date leaveDate;        // 离职日期
    private Date retireDate;        // 退休日期
    private String jobStatus;        // 在职状态
    private String timecardNo;        // 对应考勤卡号
    private String isMothball;        // 是否后备人才
    private String recruitType;        // 应聘方式
    private Date birthday;        // 生日
    private String nation;        // 民族
    private String nativePlace;        // 籍贯
    private String politicalStatus;        // 政治面貌
    private String party;        // 政党团体
    private Date joinPartyDate;        // 参加政治团体日期
    private Date realEmployeeDate;        // 转正日期
    private String marriageStatus;        // 婚姻状况
    private Date graduateDate;        // 毕业时间
    private String graduateSchool;        // 毕业院校
    private String major;        // 学习专业
    private String schoolingLength;        // 学制
    private String educationalBackground;        // 学历
    private String foreignLanguage;        // 外语掌握程度
    private Date jobDate;        // 参加工作时间
    private String fileDepositOrganization;        // 档案托管单位
    private String householdRegisterType;        // 户籍类型
    private String householdRegisterAddress;        // 户口地址
    private String houseAddress;        // 家庭住址
    private String phoneNo;        // 家庭电话
    private String zipCode;        // 家庭邮编
    private String mobilePhoneNo;        // 手机
    private String address;        // 通信地址
    private String qq;        // QQ
    private String email;        // E-mail
    private String englishName;        // 英文名
    private String province;        // 省
    private String city;        // 市
    private String computerLevel;        // 计算机水平
    private byte[] avatar;        // 员工大头照
    private String orgId;        // 组织id
    private String fileResourceId;//头像资源ID
    private String stationInfoId;//所属岗位ID
    private String employeeRegistrationMstId;//入职登记主表ID
    private String workType;//工种
    private String officePhoneNo;//办公电话
    private String enterpriseInternalLine;//企业内线
    private String administrativeLevel ;//行政级别
    private String status;//单据状态
    private String checkUser;//核准人
    private Date checkDate;//核准日期
    private String infoStatus;//个人信息状态
    private String referee; //入职介绍人
    private String authCode;// 授权码
    private Date jobGraduateDate;        // 就业学历时间
    private String jobGraduateSchool;        // 就业学历学校院校
    private String jobMajor;        // 就业学历所学专业
    private String jobSchoolingLength;        // 就业学历学制
    private String jobEducationalBackground;        // 就业学历
    private String jobDegree;        // 就业学位
    private String highDegree;        // 现学历学位
    private String employeeNature;  //员工性质
    private String partyFlag;  //党委负责人标识
    private String bankCardNumber;  //银行卡号
    private String languages;  //语种
    private Date enterIndustryDate;  //进入本行业时间
    private String soldierFlag;  //复转军人标识
    private String individualStatus;  //个人身份
    private String isMedicalSocialSecurity;  //是否交医社保
    private String fileNo;  //档案编号

    public String getIsMedicalSocialSecurity() {
        return isMedicalSocialSecurity;
    }

    public void setIsMedicalSocialSecurity(String isMedicalSocialSecurity) {
        this.isMedicalSocialSecurity = isMedicalSocialSecurity;
    }

    public String getFileNo() {
        return fileNo;
    }

    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee;
    }

    public String getInfoStatus() {
        return infoStatus;
    }

    public void setInfoStatus(String infoStatus) {
        this.infoStatus = infoStatus;
    }

    public String getOfficePhoneNo() {
        return officePhoneNo;
    }

    public void setOfficePhoneNo(String officePhoneNo) {
        this.officePhoneNo = officePhoneNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public String getEnterpriseInternalLine() {
        return enterpriseInternalLine;
    }

    public void setEnterpriseInternalLine(String enterpriseInternalLine) {
        this.enterpriseInternalLine = enterpriseInternalLine;
    }

    public String getAdministrativeLevel() {
        return administrativeLevel;
    }

    public void setAdministrativeLevel(String administrativeLevel) {
        this.administrativeLevel = administrativeLevel;
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }

    public EmployeeFiles() {
        super();
    }

    public EmployeeFiles(String id) {
        super(id);
    }

    @ExcelField(title = "员工编码", align = 2, sort = 1)
    public String getEmployeeNo() {
        return employeeNo;
    }

    public void setEmployeeNo(String employeeNo) {
        this.employeeNo = employeeNo;
    }

    @ExcelField(title = "员工姓名", align = 2, sort = 2)
    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    @ExcelField(title = "曾用名", align = 2, sort = 3)
    public String getEmployeeBeforeName() {
        return employeeBeforeName;
    }

    public void setEmployeeBeforeName(String employeeBeforeName) {
        this.employeeBeforeName = employeeBeforeName;
    }

    @ExcelField(title = "性别", align = 2, sort = 4)
    public String getSexNo() {
        return sexNo;
    }

    public void setSexNo(String sexNo) {
        this.sexNo = sexNo;
    }

    @ExcelField(title = "法人组织id", align = 2, sort = 5)
    public String getOrganizationId1() {
        return organizationId1;
    }

    public void setOrganizationId1(String organizationId1) {
        this.organizationId1 = organizationId1;
    }

    @ExcelField(title = "部门组织ID", align = 2, sort = 6)
    public String getOrganizationId2() {
        return organizationId2;
    }

    public void setOrganizationId2(String organizationId2) {
        this.organizationId2 = organizationId2;
    }

    @ExcelField(title = "员工类型", align = 2, sort = 7)
    public String getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(String employeeType) {
        this.employeeType = employeeType;
    }

    @ExcelField(title = "证件类型", align = 2, sort = 8)
    public String getCredentialsType() {
        return credentialsType;
    }

    public void setCredentialsType(String credentialsType) {
        this.credentialsType = credentialsType;
    }

    @ExcelField(title = "证件编号", align = 2, sort = 9)
    public String getCredentialsNo() {
        return credentialsNo;
    }

    public void setCredentialsNo(String credentialsNo) {
        this.credentialsNo = credentialsNo;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "入职时间", align = 2, sort = 10)
    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    @ExcelField(title = "职称", align = 2, sort = 11)
    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    @ExcelField(title = "职务", align = 2, sort = 12)
    public String getJobPost() {
        return jobPost;
    }

    public void setJobPost(String jobPost) {
        this.jobPost = jobPost;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "离职日期", align = 2, sort = 13)
    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "退休日期", align = 2, sort = 14)
    public Date getRetireDate() {
        return retireDate;
    }

    public void setRetireDate(Date retireDate) {
        this.retireDate = retireDate;
    }

    @ExcelField(title = "在职状态", align = 2, sort = 15)
    public String getJobStatus() {
        return jobStatus;
    }

    public void setJobStatus(String jobStatus) {
        this.jobStatus = jobStatus;
    }

    @ExcelField(title = "对应考勤卡号", align = 2, sort = 16)
    public String getTimecardNo() {
        return timecardNo;
    }

    public void setTimecardNo(String timecardNo) {
        this.timecardNo = timecardNo;
    }

    @ExcelField(title = "是否后备人才", align = 2, sort = 17)
    public String getIsMothball() {
        return isMothball;
    }

    public void setIsMothball(String isMothball) {
        this.isMothball = isMothball;
    }

    @ExcelField(title = "应聘方式", align = 2, sort = 18)
    public String getRecruitType() {
        return recruitType;
    }

    public void setRecruitType(String recruitType) {
        this.recruitType = recruitType;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")//tomcat配置： VM options增加-Duser.timezone=GMT+8
    @ExcelField(title = "生日", align = 2, sort = 19)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @ExcelField(title = "民族", align = 2, sort = 20)
    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    @ExcelField(title = "籍贯", align = 2, sort = 21)
    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    @ExcelField(title = "政治面貌", align = 2, sort = 22)
    public String getPoliticalStatus() {
        return politicalStatus;
    }

    public void setPoliticalStatus(String politicalStatus) {
        this.politicalStatus = politicalStatus;
    }

    @ExcelField(title = "政党团体", align = 2, sort = 23)
    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "参加政治团体日期", align = 2, sort = 24)
    public Date getJoinPartyDate() {
        return joinPartyDate;
    }

    public void setJoinPartyDate(Date joinPartyDate) {
        this.joinPartyDate = joinPartyDate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "转正日期", align = 2, sort = 25)
    public Date getRealEmployeeDate() {
        return realEmployeeDate;
    }

    public void setRealEmployeeDate(Date realEmployeeDate) {
        this.realEmployeeDate = realEmployeeDate;
    }

    @ExcelField(title = "婚姻状况", align = 2, sort = 26)
    public String getMarriageStatus() {
        return marriageStatus;
    }

    public void setMarriageStatus(String marriageStatus) {
        this.marriageStatus = marriageStatus;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "毕业时间", align = 2, sort = 27)
    public Date getGraduateDate() {
        return graduateDate;
    }

    public void setGraduateDate(Date graduateDate) {
        this.graduateDate = graduateDate;
    }

    @ExcelField(title = "毕业院校", align = 2, sort = 28)
    public String getGraduateSchool() {
        return graduateSchool;
    }

    public void setGraduateSchool(String graduateSchool) {
        this.graduateSchool = graduateSchool;
    }

    @ExcelField(title = "学习专业", align = 2, sort = 29)
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @ExcelField(title = "学制", align = 2, sort = 30)
    public String getSchoolingLength() {
        return schoolingLength;
    }

    public void setSchoolingLength(String schoolingLength) {
        this.schoolingLength = schoolingLength;
    }

    @ExcelField(title = "学历", align = 2, sort = 31)
    public String getEducationalBackground() {
        return educationalBackground;
    }

    public void setEducationalBackground(String educationalBackground) {
        this.educationalBackground = educationalBackground;
    }

    @ExcelField(title = "外语掌握程度", align = 2, sort = 32)
    public String getForeignLanguage() {
        return foreignLanguage;
    }

    public void setForeignLanguage(String foreignLanguage) {
        this.foreignLanguage = foreignLanguage;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelField(title = "参加工作时间", align = 2, sort = 33)
    public Date getJobDate() {
        return jobDate;
    }

    public void setJobDate(Date jobDate) {
        this.jobDate = jobDate;
    }

    @ExcelField(title = "档案托管单位", align = 2, sort = 34)
    public String getFileDepositOrganization() {
        return fileDepositOrganization;
    }

    public void setFileDepositOrganization(String fileDepositOrganization) {
        this.fileDepositOrganization = fileDepositOrganization;
    }

    @ExcelField(title = "户籍类型", align = 2, sort = 35)
    public String getHouseholdRegisterType() {
        return householdRegisterType;
    }

    public void setHouseholdRegisterType(String householdRegisterType) {
        this.householdRegisterType = householdRegisterType;
    }

    @ExcelField(title = "户口地址", align = 2, sort = 36)
    public String getHouseholdRegisterAddress() {
        return householdRegisterAddress;
    }

    public void setHouseholdRegisterAddress(String householdRegisterAddress) {
        this.householdRegisterAddress = householdRegisterAddress;
    }

    @ExcelField(title = "家庭住址", align = 2, sort = 37)
    public String getHouseAddress() {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress) {
        this.houseAddress = houseAddress;
    }

    @ExcelField(title = "家庭电话", align = 2, sort = 38)
    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @ExcelField(title = "家庭邮编", align = 2, sort = 39)
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    @ExcelField(title = "手机", align = 2, sort = 40)
    public String getMobilePhoneNo() {
        return mobilePhoneNo;
    }

    public void setMobilePhoneNo(String mobilePhoneNo) {
        this.mobilePhoneNo = mobilePhoneNo;
    }

    @ExcelField(title = "通信地址", align = 2, sort = 41)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @ExcelField(title = "QQ", align = 2, sort = 42)
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @ExcelField(title = "E-mail", align = 2, sort = 43)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @ExcelField(title = "英文名", align = 2, sort = 49)
    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    @ExcelField(title = "省", align = 2, sort = 50)
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @ExcelField(title = "市", align = 2, sort = 51)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @ExcelField(title = "计算机水平", align = 2, sort = 52)
    public String getComputerLevel() {
        return computerLevel;
    }

    public void setComputerLevel(String computerLevel) {
        this.computerLevel = computerLevel;
    }


    @ExcelField(title = "组织id", align = 2, sort = 54)
    public String getOrgId() {
        return orgId;
    }


    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public String getFileResourceId() {
        return fileResourceId;
    }

    public void setFileResourceId(String fileResourceId) {
        this.fileResourceId = fileResourceId;
    }

    public String getStationInfoId() {
        return stationInfoId;
    }

    public void setStationInfoId(String stationInfoId) {
        this.stationInfoId = stationInfoId;
    }

    public String getEmployeeRegistrationMstId() {
        return employeeRegistrationMstId;
    }

    public void setEmployeeRegistrationMstId(String employeeRegistrationMstId) {
        this.employeeRegistrationMstId = employeeRegistrationMstId;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }

    public Date getJobGraduateDate() {
        return jobGraduateDate;
    }

    public void setJobGraduateDate(Date jobGraduateDate) {
        this.jobGraduateDate = jobGraduateDate;
    }

    public String getJobGraduateSchool() {
        return jobGraduateSchool;
    }

    public void setJobGraduateSchool(String jobGraduateSchool) {
        this.jobGraduateSchool = jobGraduateSchool;
    }

    public String getJobMajor() {
        return jobMajor;
    }

    public void setJobMajor(String jobMajor) {
        this.jobMajor = jobMajor;
    }

    public String getJobSchoolingLength() {
        return jobSchoolingLength;
    }

    public void setJobSchoolingLength(String jobSchoolingLength) {
        this.jobSchoolingLength = jobSchoolingLength;
    }

    public String getJobEducationalBackground() {
        return jobEducationalBackground;
    }

    public void setJobEducationalBackground(String jobEducationalBackground) {
        this.jobEducationalBackground = jobEducationalBackground;
    }

    public String getJobDegree() {
        return jobDegree;
    }

    public void setJobDegree(String jobDegree) {
        this.jobDegree = jobDegree;
    }

    public String getHighDegree() {
        return highDegree;
    }

    public void setHighDegree(String highDegree) {
        this.highDegree = highDegree;
    }

    public String getEmployeeNature() {
        return employeeNature;
    }

    public void setEmployeeNature(String employeeNature) {
        this.employeeNature = employeeNature;
    }

    public String getPartyFlag() {
        return partyFlag;
    }

    public void setPartyFlag(String partyFlag) {
        this.partyFlag = partyFlag;
    }

    public String getBankCardNumber() {
        return bankCardNumber;
    }

    public void setBankCardNumber(String bankCardNumber) {
        this.bankCardNumber = bankCardNumber;
    }

    public String getLanguages() {
        return languages;
    }

    public void setLanguages(String languages) {
        this.languages = languages;
    }


    public Date getEnterIndustryDate() {
        return enterIndustryDate;
    }

    public void setEnterIndustryDate(Date enterIndustryDate) {
        this.enterIndustryDate = enterIndustryDate;
    }

    public String getSoldierFlag() {
        return soldierFlag;
    }

    public void setSoldierFlag(String soldierFlag) {
        this.soldierFlag = soldierFlag;
    }

    public String getIndividualStatus() {
        return individualStatus;
    }

    public void setIndividualStatus(String individualStatus) {
        this.individualStatus = individualStatus;
    }
}