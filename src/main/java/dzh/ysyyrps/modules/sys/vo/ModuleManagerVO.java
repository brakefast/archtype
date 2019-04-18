package dzh.ysyyrps.modules.sys.vo;

import java.io.Serializable;
import dzh.ysyyrps.modules.sys.entity.ModuleManager;

/**
 * 模块管理者
 * @author ciocem
 * @version 2017-08-17
 */
public class ModuleManagerVO extends ModuleManager implements Serializable {
	private static final long serialVersionUID = 1L;
	private String createByName;//创建人
	private String updateByName;//更新人

	public String getCreateByName() {
		return createByName;
	}
	public void setCreateByName(String createByName) {
		this.createByName = createByName;
	}
	public String getUpdateByName() {
		return updateByName;
	}
	public void setUpdateByName(String updateByName) {
		this.updateByName = updateByName;
	}
	
}