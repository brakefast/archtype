package dzh.ysyyrps.modules.base.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import dzh.ysyyrps.modules.base.entity.ExcelTemplate;
import dzh.ysyyrps.modules.base.vo.ExcelTemplateVO;
import org.apache.ibatis.annotations.Param;

/**
 * Excel模板DAO接口
 * @author tyluo
 * @version 2017-03-23
 */
@MyBatisDao
public interface ExcelTemplateDao extends CrudDao<ExcelTemplate,ExcelTemplateVO> {

    /**
     * 根据字段查询具体值
     * @param relTableName
     * @param relColumnName
     * @param relValue
     * @return
     */
	public String getValByRelTable(@Param(value = "relTableName") String relTableName, @Param(value = "relColumnName") String relColumnName, @Param(value = "relValue") String relValue);
}