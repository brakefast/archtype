/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import com.ciocem.api.sys.dto.DictDto;
import org.apache.ibatis.annotations.Param;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.web.BootstrapTablePage;
import dzh.ysyyrps.modules.sys.entity.Dict;
import dzh.ysyyrps.modules.sys.vo.DictVO;

/**
 * 字典DAO接口
 * @author tyluo
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict,DictVO> {

	public List<String> findTypeList(Dict dict);

	/**
	 *
	 * @param dictDto
	 * @return
	 */
	 List<DictDto> findList4App(@Param(value = "entity") DictDto dictDto);

	/**
	 * 查询所有数据列表
	 * @param dict
	 * @return
	 */
	public List<Dict> findAllList(Dict dict);

	/**
	 * 查询前三级的数据
	 * @param dict
	 * @return
	 */
	public List<Dict> findTopThreeLevelList(Dict dict);

	/**
	 * 查询目录下的数据
	 * 异步加载
	 * @param id
	 * @return
	 */
	public List<DictVO> findListByNodeId(@Param(value = "id") String id, @Param(value = "entity") DictVO dictVO);
	/**
	 * 分页查询
	 * @param page
	 * @param dictVO
	 * @return
	 */
	public List<DictVO> getListByPage(@Param(value = "page") BootstrapTablePage page,
                                      @Param(value = "entity") DictVO dictVO);
	
	/**
	 * 分页查询总数
	 * @param dictVO
	 * @return
	 */
	public int getTotalByPage(@Param(value = "entity") DictVO dictVO);

	/**
	 * 递归查询所有基础数据的类型
	 * @param id
	 * @return
	 */
	public List<DictVO> getJuniorDict(@Param(value = "id") String id, @Param(value = "entity") DictVO dictVO, @Param(value = "dbName") String dbName);
}
