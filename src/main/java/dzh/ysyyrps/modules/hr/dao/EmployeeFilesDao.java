package dzh.ysyyrps.modules.hr.dao;

import java.util.Date;
import java.util.List;

import com.ciocem.api.common.TablePage;
import com.ciocem.api.hr.dto.EmployeeDto;
import com.ciocem.api.hr.dto.EmployeeParamsDto;
import dzh.ysyyrps.modules.hr.vo.EmployeeFiles4TreeVO;
import dzh.ysyyrps.modules.hr.vo.EmployeeFilesForDjhrVO;
import org.apache.ibatis.annotations.Param;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.web.JqGridTablePage;
import dzh.ysyyrps.modules.hr.entity.EmployeeFiles;
import dzh.ysyyrps.modules.hr.vo.EmpDataVO;
import dzh.ysyyrps.modules.hr.vo.EmployeeFilesVO;

/**
 * 员工档案DAO接口
 * @author tyluo
 * @version 2016-12-14
 */
@MyBatisDao
public interface EmployeeFilesDao extends CrudDao<EmployeeFiles,EmployeeFilesVO> {

	/**
	 * 
	 * @param page
	 * @param empDataVO
	 * @return
	 */
	List<EmpDataVO> getEmpDataByPage(@Param(value = "page") JqGridTablePage page, @Param(value = "entity") EmpDataVO empDataVO);
	/**
	 * 员工生日提醒功能
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	List<EmployeeFilesVO> getEmpNameByBirthRange(@Param("beginDate") Date beginDate, @Param("endDate") Date endDate, @Param("dbName") String dbName);
	/**
	 * 
	 * @param empDataVO
	 * @return
	 */
	int getTotalEmpData(@Param(value = "entity") EmpDataVO empDataVO);


	/*****
	 * 手机端查询数据
	 * @param page
	 * @param paramsDto
	 * @return
	 */
	List<EmployeeDto> getList7App(@Param(value = "page") TablePage page, @Param(value = "entity") EmployeeParamsDto paramsDto);

	/****
	 * 手机端查询数据 数量
	 * @param paramDto
	 * @return
	 */
	int getTotalList7App(@Param(value = "entity") EmployeeParamsDto paramDto);

	/***
	 * 根据vo查找员工数量
	 * @param employeeFilesVO
	 * @return
	 */
	int getEmployeeNumber(@Param(value = "entity") EmployeeFilesVO employeeFilesVO);

	/***
	 * 电建Hr 查找员工
	 * @param employeeFilesForDjhrVO
	 * @return
	 */
	List<EmployeeFilesForDjhrVO> getEmpDataForDjhr(@Param(value = "entity") EmployeeFilesForDjhrVO employeeFilesForDjhrVO);
	/***
	 * 查找组织和员工结合的树
	 * @param
	 * @return
	 */
	List<EmployeeFiles4TreeVO> getEmployeeFilesTreeData(@Param(value = "entity") EmployeeFiles4TreeVO employeeFiles4TreeVO);
}