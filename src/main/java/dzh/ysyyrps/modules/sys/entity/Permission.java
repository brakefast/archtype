package dzh.ysyyrps.modules.sys.entity;


import com.ciocem.common.dao.DataEntity;

/**
 * 授权权限表Entity
 * @author tyluo
 * @version 2017-04-25
 */
public class Permission extends DataEntity<Permission> {
	private static final long serialVersionUID = 1L;
	private String bustype;		// 业务类型 1用户 2角色
	private String rightId;		// 权限
	private String busid;		// 业务主键
	private String orgId;		// 所属组织
	
	public Permission() {
		super();
	}

	public Permission(String id){
		super(id);
	}

	public String getBustype() {
		return bustype;
	}

	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	
	public String getRightId() {
		return rightId;
	}

	public void setRightId(String rightId) {
		this.rightId = rightId;
	}
	
	public String getBusid() {
		return busid;
	}

	public void setBusid(String busid) {
		this.busid = busid;
	}
	
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
}