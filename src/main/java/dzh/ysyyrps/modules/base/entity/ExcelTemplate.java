package dzh.ysyyrps.modules.base.entity;


import com.ciocem.common.dao.DataEntity;

/**
 * Excel模板Entity
 * @author tyluo
 * @version 2017-03-23
 */
public class ExcelTemplate extends DataEntity<ExcelTemplate> {
	private static final long serialVersionUID = 1L;
	private String moduleName;		// 模块名称
	private String moduleKey;		// 模块KEY
	private String templateCode;		// 模板代码
	private String templateName;		// 模板名称
	private String type;		// 模板类型
	private int headNum;		// 头文件行数
	private String tableName;  //数据库表名
	
	public ExcelTemplate() {
		super();
	}

	public ExcelTemplate(String id){
		super(id);
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	
	public String getModuleKey() {
		return moduleKey;
	}

	public void setModuleKey(String moduleKey) {
		this.moduleKey = moduleKey;
	}
	
	public String getTemplateCode() {
		return templateCode;
	}

	public void setTemplateCode(String templateCode) {
		this.templateCode = templateCode;
	}
	
	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getHeadNum() {
		return headNum;
	}

	public void setHeadNum(int headNum) {
		this.headNum = headNum;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
}