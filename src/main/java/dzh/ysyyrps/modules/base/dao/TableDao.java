package dzh.ysyyrps.modules.base.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.modules.base.entity.ExcelColumn;
import dzh.ysyyrps.modules.base.vo.ColumnVO;
import dzh.ysyyrps.modules.base.vo.ExcelColumnVO;
import dzh.ysyyrps.modules.base.vo.TableColumnVO;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据表 DAO接口
 * @author tyluo
 * @version 2017-03-27
 */
@MyBatisDao
public interface TableDao extends CrudDao<ExcelColumn,ExcelColumnVO> {

    /**
     * 根据表名查询字段信息
     * @param tableName
     * @param dbName
     * @return
     */
	public List<ColumnVO> getColumnLsByTableName(@Param(value = "dbName") String dbName, @Param(value = "tableName") String tableName, @Param(value = "columnName") String columnName);

    /**
     * 查询数据库的所有表名
     * @return
     */
    public List<String> getTableNameLs(@Param(value = "dbName") String dbName);

    /**
     * 根据字段名查询表集合
     * @param columnName
     * @return
     */
    public List<String> getTableNameLsByColumnName(String columnName);

    /**
     * 根据字段名和字段值查询表结果集总数
     * @param tableName
     * @param columnName
     * @param columnValue
     * @return
     */
    public Integer getTotalByColumn(@Param(value = "tableName") String tableName, @Param(value = "columnName") String columnName, @Param(value = "columnValue") String columnValue);

    /**
     * 根据部分字段名查询表集合
     * @param partColumnName
     * @return
     */
    public List<String> getTableNameLsByPartColumnName(@Param(value = "partColumnName") String partColumnName);
    /**
     * 根据部分字段名与表名查询  该表的类似行的集合
     * @param partColumnName
     * @return
     */
    public List<String> getTableColumnNameLs(@Param(value = "tableName") String tableName, @Param(value = "partColumnName") String partColumnName);
    /**
     * 根据字段名和字段值查询表结果集总数
     * @param tableName
     * @param columnName
     * @param columnValue
     * @return
     */
    public Integer getTotalByPartColumn(@Param(value = "tableName") String tableName, @Param(value = "columnName") String columnName, @Param(value = "columnValue") String columnValue);


    /**
     * 执行Sql
     * @param sql
     * @return
     */
    List<LinkedHashMap<String, Object>> executeSQL(String sql);


    /**
     * 根据Id查询记录
     * @param dbName
     * @param tableName
     *  特殊场景使用！！@
     * @return
     */
    public Map<String, Object> getTableRecordById(
            @Param(value = "dbName") String dbName,
            @Param(value = "id") String id,
            @Param(value = "tableName") String tableName,
            @Param(value = "columnNames") String columnNames);

    /**
     * 判断数据库的表是否存在
     * @param dbName
     * @param tableName
     * @return
     */
    public int tableExistsJudge(@Param(value = "dbName") String dbName, @Param(value = "tableName") String tableName);
    /**
     * 判断数据库的表字段是否存在
     * @param dbName
     * @param tableName
     * @return
     */
    public int tableColumnExistsJudge(@Param(value = "dbName") String dbName, @Param(value = "tableName") String tableName, @Param(value = "columnName") String columnName);

    /**
     * 根据部分字段名（字段为'aaa' 我可能值传入一个'a'）找表和具体字段名
     * @param partColumnName
     * @return
     */
    List<TableColumnVO> getTableNameAndColumnNameLsByPartColumnName(@Param(value = "partColumnName") String partColumnName);
}