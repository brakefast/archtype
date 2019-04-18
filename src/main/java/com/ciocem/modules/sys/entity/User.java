package com.ciocem.modules.sys.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.ciocem.common.dao.DataEntity;

/**
 * 用户Entity
 * @author tyluo
 * @version 2017-04-25
 */
public class User extends DataEntity<User> {
	private static final long serialVersionUID = 1L;
	private String loginName;		// 登录名
	private String password;		// 密码
	private String name;		// 用户名
	private String isSys;		// 是否系统内置
	private String headImgurl;		// 头像地址
	private String loginIp;		// 最后登陆ip
	private Date loginDate;		// 最后登陆日期
	private String loginFlag;		// 是否允许登录 0禁用 1正常
	private String loginOrgId;		//最后登陆组织
	private String employeeFilesId;		// 员工id
	private String mnemonicCode;		// 助记码
	private String lockFlag; //锁定标识 0 未锁定 1锁定
	private String loginProjectId; //最后登录项目

	public String getLoginProjectId() {
		return loginProjectId;
	}

	public void setLoginProjectId(String loginProjectId) {
		this.loginProjectId = loginProjectId;
	}

	public User() {
		super();
	}

	public User(String id){
		super(id);
	}
	
	public User(String id, String loginName){
		super(id);
		this.loginName = loginName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getIsSys() {
		return isSys;
	}

	public void setIsSys(String isSys) {
		this.isSys = isSys;
	}
	
	public String getHeadImgurl() {
		return headImgurl;
	}

	public void setHeadImgurl(String headImgurl) {
		this.headImgurl = headImgurl;
	}
	
	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	
	public String getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
	}	
	
	public String getLoginOrgId() {
		return loginOrgId;
	}

	public void setLoginOrgId(String loginOrgId) {
		this.loginOrgId = loginOrgId;
	}

	public String getEmployeeFilesId() {
		return employeeFilesId;
	}

	public void setEmployeeFilesId(String employeeFilesId) {
		this.employeeFilesId = employeeFilesId;
	}
	
	public String getMnemonicCode() {
		return mnemonicCode;
	}

	public void setMnemonicCode(String mnemonicCode) {
		this.mnemonicCode = mnemonicCode;
	}

	public String getLockFlag() {
		return lockFlag;
	}

	public void setLockFlag(String lockFlag) {
		this.lockFlag = lockFlag;
	}
	
}