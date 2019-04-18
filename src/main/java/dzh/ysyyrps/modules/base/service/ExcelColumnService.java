package dzh.ysyyrps.modules.base.service;

import java.util.List;

import com.ciocem.common.utils.PubUtil;
import dzh.ysyyrps.modules.base.entity.ExcelTemplate;
import dzh.ysyyrps.modules.base.vo.ColumnVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciocem.common.service.CrudService;
import com.ciocem.modules.base.entity.ExcelColumn;
import dzh.ysyyrps.modules.base.vo.ExcelColumnVO;
import dzh.ysyyrps.modules.base.dao.ExcelColumnDao;
/**
 * Excel配置项Service
 * @author tyluo
 * @version 2017-03-23
 */
@Service
@Transactional(readOnly = true)
public class ExcelColumnService extends CrudService<ExcelColumnDao, ExcelColumn, ExcelColumnVO> {
    @Autowired
	private ExcelColumnDao excelColumnDao;
    @Autowired
    private TableService tableService;

    @Transactional(readOnly = false)
	 public void saveTemplateColumn(ExcelTemplate excelTemplate,String columnNames){
//        excelColumnDao.deleteExcelColumnByTemplateId(excelTemplate.getId());


        //1、去掉 旧字段
        ExcelColumnVO excelColumnVO = new ExcelColumnVO();
        excelColumnVO.setExcelTemplateId(excelTemplate.getId());
        List<ExcelColumnVO> excelColumnVOs = excelColumnDao.findListByVO(excelColumnVO);
        if(PubUtil.isNotEmptyList(excelColumnVOs)){
            for(ExcelColumnVO columnVO : excelColumnVOs){
                boolean isExist = false;
                if(PubUtil.isNotEmpty(columnNames)) {
                    String[] columnNameArr = columnNames.split(",");
                    for(String name : columnNameArr){
                        //如果相等则说明 数据库已经存在不允许删除
                        if(columnVO.getColumnName().equals(name)){
                            isExist = true;
                        }
                    }
                }

                if(!isExist){
                    excelColumnDao.delete(columnVO);
                }
            }
        }


        //2、新增 新字段
        if(PubUtil.isNotEmpty(columnNames)){
            String[] columnNameArr = columnNames.split(",");
            int columnNo = 0;
            //目前选中的列
            for(String columnName : columnNameArr){
                boolean isExist = false;
                if(PubUtil.isNotEmptyList(excelColumnVOs)){
                    for(ExcelColumnVO columnVO : excelColumnVOs){
                        if(columnName.equals(columnVO.getColumnName())){
                            isExist = true;
                        }
                    }
                }

                //如果不存在则插入字段
                if(!isExist){
                    ExcelColumn excelColumn = new ExcelColumn();
                    excelColumn.setColumnType("0");//字符串类型
                    excelColumn.setColumnRemark(columnName);
                    ColumnVO columnVO = tableService.getColumnByTableAndColumnName(excelTemplate.getTableName(),columnName);
                    //如果备注有的话，默认取备注，如果没有默认为字段名称
                    if(PubUtil.isNotEmpty(columnVO)&&PubUtil.isNotEmpty(columnVO.getColumnRemark())){
                        excelColumn.setColumnRemark(columnVO.getColumnRemark());
                    }
                    if("datetime".equalsIgnoreCase(columnVO.getColumnType())){
                        excelColumn.setColumnType("1");//日期类型
                    }
                    if("numeric".equalsIgnoreCase(columnVO.getColumnType())&&"18".equals(columnVO.getColumnLength())){
                        excelColumn.setColumnType("2");//bigDecimal
                    }else if("int".equalsIgnoreCase(columnVO.getColumnType())){
                        excelColumn.setColumnType("3");//整型
                    }
                    excelColumn.setColumnName(columnName);
                    excelColumn.setExcelTemplateId(excelTemplate.getId());
                    excelColumn.setColumnNo(columnNo);
                    columnNo++;
                    super.save(excelColumn);
                }
            }
        }
     }
}