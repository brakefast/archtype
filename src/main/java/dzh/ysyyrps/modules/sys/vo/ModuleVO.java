package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

import dzh.ysyyrps.modules.sys.utils.Global;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class ModuleVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 模块类型
	 */
	private String moduleType;
	/**
	 * 模块key
	 */
	private String moduleKey;
	/**
	 * 模块名称
	 */
	private String moduleName;
	/**
	 * 备注信息
	 */
	private String remarks;
	
	public String getModuleType() {
		return moduleType;
	}
	public void setModuleType(String moduleType) {
		this.moduleType = moduleType;
	}
	public String getModuleKey() {
		return moduleKey;
	}
	public void setModuleKey(String moduleKey) {
		this.moduleKey = moduleKey;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	/**
	 * 获取数据库名称
	 */
	@JsonIgnore
	public String getDbName(){
		return Global.getConfig("jdbc.type");
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
