/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import dzh.ysyyrps.modules.sys.entity.Log;
import dzh.ysyyrps.modules.sys.vo.LogVO;

/**
 * 日志DAO接口
 * @author 
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log,LogVO> {

	/*
	 * 通过LogVO内ID查询异常信息
	 */
	public LogVO getExceptionById(String id);
}
