package dzh.ysyyrps.modules.sys.vo;

import dzh.ysyyrps.modules.sys.utils.Global;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.List;

/**
 * 用户选择
 */
public class UserTableVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String userId;
	private String userName;
	private String loginName;
	private String headImg;

	//查询条件
	private List<String> roleIdLs;//角色集合
	private String selectedRoleId;//具体角色ID
	private String keyword;//关键字

	//查询条件
	private List<String> stationIdLs;//岗位集合
	private String selectedStationId;//具体岗位ID
	private List<String> userIdLs;

	private String deploymentId;// 流程部署ID
	private String resourceId;// 资源ID


	private String jobStatus;//在职状态

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 全局变量对象
	 */
	@JsonIgnore
	public Global getGlobal() {
		return Global.getInstance();
	}

	/**
	 * 获取数据库名称
	 */
	@JsonIgnore
	public String getDbName(){
		return Global.getConfig("jdbc.type");
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

	public List<String> getRoleIdLs() {
		return roleIdLs;
	}

	public void setRoleIdLs(List<String> roleIdLs) {
		this.roleIdLs = roleIdLs;
	}

	public String getSelectedRoleId() {
		return selectedRoleId;
	}

	public void setSelectedRoleId(String selectedRoleId) {
		this.selectedRoleId = selectedRoleId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<String> getStationIdLs() {
		return stationIdLs;
	}

	public void setStationIdLs(List<String> stationIdLs) {
		this.stationIdLs = stationIdLs;
	}

	public String getSelectedStationId() {
		return selectedStationId;
	}

	public void setSelectedStationId(String selectedStationId) {
		this.selectedStationId = selectedStationId;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public List<String> getUserIdLs() {
		return userIdLs;
	}

	public void setUserIdLs(List<String> userIdLs) {
		this.userIdLs = userIdLs;
	}
}
