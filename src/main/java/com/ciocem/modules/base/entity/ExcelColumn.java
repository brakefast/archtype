package com.ciocem.modules.base.entity;


import com.ciocem.common.dao.DataEntity;

/**
 * Excel配置项Entity
 * @author tyluo
 * @version 2017-03-23
 */
public class ExcelColumn extends DataEntity<ExcelColumn> {
	private static final long serialVersionUID = 1L;
	private Integer columnNo;		// 序号
	private String columnName;		// 字段名
	private String columnType;		// 字段类型
	private String excelTemplateId;		// Excel模板ID
	private String columnRemark;  //字段备注
	private String columnRule;    //校验规则
	private String type;//类型  0 关联字典 1关联业务表  2不关联


	private String relTableName;//关联表名
	private String relColumnName;//关联字段名
	private String relDictName;//关联数据字典

	
	public ExcelColumn() {
		super();
	}

	public ExcelColumn(String id){
		super(id);
	}

	public Integer getColumnNo() {
		return columnNo;
	}

	public void setColumnNo(Integer columnNo) {
		this.columnNo = columnNo;
	}
	
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	
	public String getExcelTemplateId() {
		return excelTemplateId;
	}

	public void setExcelTemplateId(String excelTemplateId) {
		this.excelTemplateId = excelTemplateId;
	}

	public String getColumnRemark() {
		return columnRemark;
	}

	public void setColumnRemark(String columnRemark) {
		this.columnRemark = columnRemark;
	}

	public String getColumnRule() {
		return columnRule;
	}

	public void setColumnRule(String columnRule) {
		this.columnRule = columnRule;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRelTableName() {
		return relTableName;
	}

	public void setRelTableName(String relTableName) {
		this.relTableName = relTableName;
	}

	public String getRelColumnName() {
		return relColumnName;
	}

	public void setRelColumnName(String relColumnName) {
		this.relColumnName = relColumnName;
	}

	public String getRelDictName() {
		return relDictName;
	}

	public void setRelDictName(String relDictName) {
		this.relDictName = relDictName;
	}
}