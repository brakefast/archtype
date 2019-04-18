package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;

public class RightDelVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public RightDelVO() {

	}

	public RightDelVO(String busId, String busType) {
		this();
		this.busId = busId;
		this.busType = busType;
	}

	private String busId;
	private String busType; // 0 角色 1 操作员

	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

	public String getBusType() {
		return busType;
	}

	public void setBusType(String busType) {
		this.busType = busType;
	}
	

	
}
