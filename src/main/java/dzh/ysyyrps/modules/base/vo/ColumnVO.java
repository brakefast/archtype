package dzh.ysyyrps.modules.base.vo;

import java.io.Serializable;

/**
 * 数据表 列属性
 * @author tyluo
 * @version 2017-03-27
 */
public class ColumnVO  implements Serializable {
     private static final long serialVersionUID = 1L;

     private String columnName; //字段名称
     private String columnType; //字段类型
     private String columnRemark;//备注信息
     private String columnLength;//字段长度

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

     public String getColumnRemark() {
          return columnRemark;
     }

     public void setColumnRemark(String columnRemark) {
          this.columnRemark = columnRemark;
     }

     public String getColumnLength() {
          return columnLength;
     }

     public void setColumnLength(String columnLength) {
          this.columnLength = columnLength;
     }
}