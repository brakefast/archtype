package dzh.ysyyrps.modules.base.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.modules.base.entity.ExcelColumn;
import dzh.ysyyrps.modules.base.vo.ExcelColumnVO;

/**
 * Excel配置项DAO接口
 * @author tyluo
 * @version 2017-03-23
 */
@MyBatisDao
public interface ExcelColumnDao extends CrudDao<ExcelColumn,ExcelColumnVO> {

    /**
     * 根据模板ID删除配置数据
     * @param excelTemplateId
     */
	public void deleteExcelColumnByTemplateId(String excelTemplateId);
}