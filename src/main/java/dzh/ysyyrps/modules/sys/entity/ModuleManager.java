package dzh.ysyyrps.modules.sys.entity;

import com.ciocem.common.dao.DataEntity;

/**
 * 模块管理者
 * @author ciocem
 * @version 2017-08-17
 */
public class ModuleManager extends DataEntity<ModuleManager> {
	private static final long serialVersionUID = 1L;

	private String busType;
	private String moduleKey;
	private String busId;
	private String orgId;

	public ModuleManager() {
		super();
	}

	public String getBusType() {
		return busType;
	}

	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getModuleKey() {
		return moduleKey;
	}

	public void setModuleKey(String moduleKey) {
		this.moduleKey = moduleKey;
	}
	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	
}