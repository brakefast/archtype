package dzh.ysyyrps.modules.hr.vo;

import java.io.Serializable;

/**
 * 组织树节点VO
 * @author jkd5170
 *
 */
public class OrgTreeNodeVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;	
	private String name;
	private Boolean isParent;
	private Boolean open; 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	public Boolean getOpen() {
		return open;
	}
	public void setOpen(Boolean open) {
		this.open = open;
	}
	
	
	
}
