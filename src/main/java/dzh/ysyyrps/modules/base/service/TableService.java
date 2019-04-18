package dzh.ysyyrps.modules.base.service;

import com.ciocem.common.constant.SYSConstant;
import com.ciocem.common.service.BusinessException;
import com.ciocem.common.utils.PubUtil;
import dzh.ysyyrps.modules.base.dao.TableDao;
import dzh.ysyyrps.modules.base.vo.ColumnVO;
import dzh.ysyyrps.modules.base.vo.TableColumnVO;
import dzh.ysyyrps.modules.sys.utils.UserUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据表信息 Service
 * @author tyluo
 * @version 2017-03-27
 */
@Service
@Transactional(readOnly = true)
public class TableService {

    @Autowired
	private TableDao tableDao;

    /**
     * 根据表名查询字段集合
     * @param tableName
     * @return
     */
    public List<ColumnVO> getColumnLsByTableName(String tableName){
        List<ColumnVO> newColumnVOs = new ArrayList<>();
       List<ColumnVO> columnVOs = tableDao.getColumnLsByTableName(UserUtils.getUser().getDbName(),tableName,null);
        //如果没有备注则默认为字段名
        if(PubUtil.isNotEmptyList(columnVOs)){
            for(ColumnVO columnVO : columnVOs){
                if(PubUtil.isEmpty(columnVO.getColumnRemark())){
                    columnVO.setColumnRemark(columnVO.getColumnName());
                }
                if("numeric".equalsIgnoreCase(columnVO.getColumnType())){
                    columnVO.setColumnType("double");
                }
                if("varchar".equalsIgnoreCase(columnVO.getColumnType())){
                    columnVO.setColumnType("string");
                }
                newColumnVOs.add(columnVO);
            }
        }
        return newColumnVOs;
    }
    /**
     * 根据表名查询字段集合
     * @param tableName
     * @return
     */
    public ColumnVO getColumnByTableAndColumnName(String tableName,String columnName){
        List<ColumnVO> columnVOs = tableDao.getColumnLsByTableName(UserUtils.getDbName(),tableName,columnName);
        if(PubUtil.isNotEmpty(columnVOs)){
            return columnVOs.get(0);
        }
        return null;
    }
    /**
     * 查询 数据库表名集合
     * @return
     */
    public List<String> getTableNameLs(){
        return tableDao.getTableNameLs(UserUtils.getDbName());
    }
    /**
     * 根据字段名和字段值查询表结果集总数
     * @param columnName
     * @param columnValue
     * @return
     */
    public List<Map> getTotalByColumn(String columnName, String columnValue){
        List<String> tableNameLs = tableDao.getTableNameLsByColumnName(columnName);
        List list = new ArrayList();
        if(PubUtil.isNotEmptyList(tableNameLs)){
            for(String tableName : tableNameLs){
                Integer result = tableDao.getTotalByColumn(tableName,columnName,columnValue);
                Map<String, Object> map = new HashedMap();
                map.put("tableName", tableName);
                map.put("count", result);
                list.add(map);
            }
        }
        return list;
    }
    /**
     * 根据部分字段名（字段为'aaa' 我可能值传入一个'a'）和字段值 检测是否存在被引用 被检测则抛出事务异常。
     * @param partColumnName
     * @param columnValue
     * @return
     */
    public void getTotalByPartColumn(String partColumnName, String columnValue) {
        List<String> tableNameLs = tableDao.getTableNameLsByPartColumnName(partColumnName);
        int result = 0;
        if (PubUtil.isNotEmptyList(tableNameLs)) {
            for (String tableName : tableNameLs) {
                List<String> columnNameLs = tableDao.getTableColumnNameLs(tableName, partColumnName);
                for (String columnName : columnNameLs) {
                    try{
                        result = tableDao.getTotalByPartColumn(tableName, columnName, columnValue);
                    } catch (Exception e){
                        continue;
                    }
                    if (result != 0) {
                        throw new BusinessException(SYSConstant.IS_QUOTED_FAILED_DELETE);
                    }
                }
            }
        }
    }

    /**
     * sql执行语句
     * @param sql
     * @return
     */
    public List<LinkedHashMap<String, Object>> executeSQL(String sql){
        return  tableDao.executeSQL(sql);
    }


    /**
     * 根据Id查询单据信息
     * @param id
     * @param tableName
     * @param columnNames
     * @return
     */
    public Map<String, Object> getTableRecordById(String id,String tableName,String columnNames){
        Map<String, Object> map = new HashedMap();
        map = tableDao.getTableRecordById(UserUtils.getDbName(),id,tableName,columnNames);
        return map;
    }

    /**
     * 根据部分字段名查询表名集合
     * @param partColumnName
     * @return
     */
    public List<TableColumnVO> getTableNameAndColumnNameLsByPartColumnName(String partColumnName){
        return tableDao.getTableNameAndColumnNameLsByPartColumnName(partColumnName);
    }

    public int tableColumnExistsJudge(String tableName,String columnName){
        return tableDao.tableColumnExistsJudge(UserUtils.getDbName(),tableName,columnName);
    }
}