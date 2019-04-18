package dzh.ysyyrps.modules.base.service;

import com.ciocem.common.constant.ExcelConstant;
import com.ciocem.common.service.BusinessException;
import com.ciocem.common.service.CrudService;
import com.ciocem.common.utils.MyBeanUtils;
import com.ciocem.common.utils.PubUtil;
import com.ciocem.common.utils.excel.ImportParam;
import dzh.ysyyrps.modules.base.dao.ExcelTemplateDao;
import com.ciocem.modules.base.entity.ExcelColumn;
import dzh.ysyyrps.modules.base.entity.ExcelTemplate;
import dzh.ysyyrps.modules.base.vo.ExcelColumnVO;
import dzh.ysyyrps.modules.base.vo.ExcelTemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
/**
 * Excel模板Service
 * @author tyluo
 * @version 2017-03-23
 */
@Service
@Transactional(readOnly = true)
public class ExcelTemplateService extends CrudService<ExcelTemplateDao, ExcelTemplate, ExcelTemplateVO> {
    @Autowired
	private ExcelTemplateDao excelTemplateDao;
    @Autowired
    private ExcelColumnService excelColumnService;

    /**
     * 根据模板编号 获得Excel导入字段配置信息
     * @param templateCode
     * @return
     */
    public ImportParam getImportParams(String templateCode){
        if(PubUtil.isEmpty(templateCode)){
            throw new BusinessException("模板不能为空！");
        }
        ImportParam importParam = new ImportParam();

        ExcelTemplateVO condition = new ExcelTemplateVO();
        condition.setTemplateCode(templateCode);
        condition.setType(ExcelConstant.EXCEL_TYPE_IMPORT);
        List<ExcelTemplateVO> excelTemplateVOLs = super.findListByVO(condition);
        if(PubUtil.isNotEmptyList(excelTemplateVOLs)){
            ExcelTemplateVO excelTemplateVO = excelTemplateVOLs.get(0);
            importParam.setTemplateId(excelTemplateVO.getId());
            importParam.setHeadNum(excelTemplateVO.getHeadNum());
            ExcelColumnVO excelColumnVO = new ExcelColumnVO();
            excelColumnVO.setExcelTemplateId(excelTemplateVO.getId());
            List<ExcelColumnVO> excelColumnVOLs = excelColumnService.findListByVO(excelColumnVO);
            if(PubUtil.isNotEmptyList(excelColumnVOLs)){
                List<ExcelColumn> importColumnLs = new ArrayList<ExcelColumn>();
                for(ExcelColumnVO columnVO : excelColumnVOLs){
                    ExcelColumn excelColumn = new ExcelColumn();
                    MyBeanUtils.copyBeanNotNull2Bean(columnVO, excelColumn);
                    importColumnLs.add(excelColumn);
                }
                importParam.setExcelColumnList(importColumnLs);
            }
        }else {
            throw new BusinessException("该模板不存在！");
        }
        return importParam;
    }

    /**
     * 根据模板编号 获得Excel导出字段配置信息
     * @param templateCode
     * @return
     */
    public ImportParam getExportParams(String templateCode){
        if(PubUtil.isEmpty(templateCode)){
            throw new BusinessException("模板不能为空！");
        }
        ImportParam importParam = new ImportParam();

        ExcelTemplateVO condition = new ExcelTemplateVO();
        condition.setTemplateCode(templateCode);
        condition.setType(ExcelConstant.EXCEL_TYPE_EXPORT);
        List<ExcelTemplateVO> excelTemplateVOLs = super.findListByVO(condition);
        if(PubUtil.isNotEmptyList(excelTemplateVOLs)){
            ExcelTemplateVO excelTemplateVO = excelTemplateVOLs.get(0);
            importParam.setTemplateId(excelTemplateVO.getId());
            importParam.setHeadNum(excelTemplateVO.getHeadNum());
            ExcelColumnVO excelColumnVO = new ExcelColumnVO();
            excelColumnVO.setExcelTemplateId(excelTemplateVO.getId());
            List<ExcelColumnVO> excelColumnVOLs = excelColumnService.findListByVO(excelColumnVO);
            if(PubUtil.isNotEmptyList(excelColumnVOLs)){
                List<ExcelColumn> importColumnLs = new ArrayList<ExcelColumn>();
                for(ExcelColumnVO columnVO : excelColumnVOLs){
                    ExcelColumn excelColumn = new ExcelColumn();
                    MyBeanUtils.copyBeanNotNull2Bean(columnVO, excelColumn);
                    importColumnLs.add(excelColumn);
                }
                importParam.setExcelColumnList(importColumnLs);
            }
        }else {
            throw new BusinessException("该模板不存在！");
        }
        return importParam;
    }


    /**
     * 根据表字段  进行转义值
     * @param relTableName
     * @param relColumnName
     * @param relValue
     * @return
     */
    public String getValByRelTable(String relTableName,String relColumnName,String relValue){
        if(PubUtil.isNotEmpty(relTableName)&&
                PubUtil.isNotEmpty(relColumnName)&&
                PubUtil.isNotEmpty(relValue)){
            String val =  excelTemplateDao.getValByRelTable(relTableName,relColumnName,relValue);
            if(PubUtil.isNotEmpty(val)){
                return val;
            }
        }
        return "";
    }
}