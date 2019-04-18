package dzh.ysyyrps.modules.base.vo;

import java.io.Serializable;

/**
 * 根据部分字段名（字段为'aaa' 我可能值传入一个'a'）找表和具体字段名
 * @author tyluo
 * @version 2017-03-27
 */
public class TableColumnVO implements Serializable {
     private static final long serialVersionUID = 1L;

     private String tableName; //表名称
     private String columnName; //字段类型

     public String getTableName() {
          return tableName;
     }

     public void setTableName(String tableName) {
          this.tableName = tableName;
     }

     public String getColumnName() {
          return columnName;
     }

     public void setColumnName(String columnName) {
          this.columnName = columnName;
     }
}