package dzh.ysyyrps.modules.sys.entity;


import com.ciocem.common.dao.DataEntity;

/**
 * 角色Entity
 * @author tyluo
 * @version 2017-04-25
 */
public class Role extends DataEntity<Role> {
	private static final long serialVersionUID = 1L;
	private String orgId;		// 所属组织
	private String name;		// 角色名称
	private String no;		// 角色编号
	private String isSys;		// 是否系统内置
	private String useable;		// 是否可用
	private String mnemonicCode;		// 助记码
	
	public Role() {
		super();
	}

	public Role(String id){
		super(id);
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public String getIsSys() {
		return isSys;
	}

	public void setIsSys(String isSys) {
		this.isSys = isSys;
	}
	
	public String getUseable() {
		return useable;
	}

	public void setUseable(String useable) {
		this.useable = useable;
	}
	
	public String getMnemonicCode() {
		return mnemonicCode;
	}

	public void setMnemonicCode(String mnemonicCode) {
		this.mnemonicCode = mnemonicCode;
	}
	
}