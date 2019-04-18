package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import com.ciocem.common.web.JqGridTablePage;
import dzh.ysyyrps.modules.sys.entity.ModuleManager;
import dzh.ysyyrps.modules.sys.vo.ModuleManageVO;
import dzh.ysyyrps.modules.sys.vo.ModuleManagerVO;
import dzh.ysyyrps.modules.sys.vo.ModuleVO;
import dzh.ysyyrps.modules.sys.vo.RightDelVO;

/**
 * 模块管理者
 * @author ciocem
 * @version 2017-08-17
 */
@MyBatisDao
public interface ModuleManagerDao extends CrudDao<ModuleManager,ModuleManagerVO> {
	
	List<ModuleVO> getModulesByPage(@Param(value = "page") JqGridTablePage page, @Param(value = "entity") ModuleVO moduleVO);
	
	int getModuleTotalByPage(@Param(value = "entity") ModuleVO moduleVO);

	void update4Lock(String id);

	void deleteByList(@Param(value = "RightDels") List<RightDelVO> delList, @Param(value = "orgId") String orgId);

	void saveData(@Param(value = "RightAdds") List<ModuleManager> addList);

	List<ModuleManageVO> getListByVO(@Param(value = "entity") ModuleManageVO manageVO);

	int getCountByManager(@Param(value = "moduleKey") String moduleKey, @Param(value = "userId") String userId, @Param(value = "orgId") String orgId);
}