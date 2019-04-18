package dzh.ysyyrps.modules.sys.vo;

/**
 * 用户树，并标记是否已选
 * @author jkd5170
 *
 */
public class UnSelUser4TreeVO extends User4TreeVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 1 未选 0已选
	 */
	private String unsel;

	public String getUnsel() {
		return unsel;
	}

	public void setUnsel(String unsel) {
		this.unsel = unsel;
	}
	
	

}
