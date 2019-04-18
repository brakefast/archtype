package dzh.ysyyrps.modules.hr.dao;

import com.ciocem.common.dao.CrudDao;
import com.ciocem.common.dao.MyBatisDao;
import dzh.ysyyrps.modules.hr.entity.Organization;
import dzh.ysyyrps.modules.hr.vo.OrgTreeNodeVO;
import dzh.ysyyrps.modules.hr.vo.OrganizationVO;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 公司内部组织DAO接口
 * @author tyluo
 * @version 2016-12-13
 */
@MyBatisDao
public interface OrganizationDao extends CrudDao<Organization,OrganizationVO> {
    /**
     * 根据上级节点递归查询所有下级
     * @param id
     * @param corporationFlag
     * @return
     */
    public List<Organization> getSubOrgLs(@Param(value = "dbName") String dbName, @Param(value = "id") String id, @Param(value = "corporationFlag") String corporationFlag);

    /**
     * 根据上级节点递归查询所有下级——项目组织
     * @param id
     * @return
     */
    public List<Organization> getSubProjectOrgLs(@Param(value = "dbName") String dbName, @Param(value = "id") String id);

    /**
     * 查询该组织节点上的法人组织
     * @param id
     * @return
     */
    public List<Organization> getCompany(@Param(value = "id") String id);

    /**
     * 查询该组织节点上的项目组织
     * @param id
     * @return
     */
    public List<Organization> getProjectOrganization(@Param(value = "id") String id);

    /**
     * 用于锁定数据，无实际更新意义
     * @param orgId
     * @return
     */
    int update4Lock(@Param(value = "id") String orgId);

    /**
     * 根据组织id获取下级节点
     * @param orgId
     * @return
     */
	public List<OrgTreeNodeVO> getSubTreeNode(@Param(value = "id") String orgId);

    /**
     * 新增组织客商
     * @param organization
     * @return
     */
    public int insert(Organization organization);

    /**
     * 同步信息
     * @return
     */
    public int syncInfo();
}