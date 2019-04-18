package dzh.ysyyrps.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import dzh.ysyyrps.modules.sys.entity.Permission;
import dzh.ysyyrps.modules.sys.vo.PermissionVO;
import dzh.ysyyrps.modules.sys.vo.RightInfoVO;
import dzh.ysyyrps.modules.sys.vo.RightPermissionVO;
import dzh.ysyyrps.modules.sys.vo.UserPermissionVO;

/**
 * 授权权限表DAO接口
 * @author tyluo
 * @version 2017-04-25
 */
@MyBatisDao
public interface PermissionDao extends CrudDao<Permission,PermissionVO> {

	/**
	 * 删除权限
	 * @param busType
	 * @param busId
	 * @param orgId
	 * @param rightIds
	 * @return
	 */
	int deleteByOther(@Param(value = "busType") String busType, @Param(value = "busId") String busId, @Param(value = "orgId") String orgId, @Param(value = "rightIds") List<List<String>> rightIds);
	
	int deleteByEach(@Param(value = "busType") String busType, @Param(value = "busId") String busId, @Param(value = "orgId") String orgId, @Param(value = "rightIds") List<String> rightIds);
	/**
	 * 获取用户需要添加的权限
	 * @param userPermissionVO
	 * @return
	 */
	List<RightInfoVO> getPermission4User2Add(@Param(value = "entity") UserPermissionVO userPermissionVO);

	/**
	 * 
	 * @return
	 */
	List<RightPermissionVO> findAllRight();

	/**
	 * 批量保存权限数据
	 * @param permissions
	 */
	void saveRights(@Param(value = "rights") List<Permission> list);
}