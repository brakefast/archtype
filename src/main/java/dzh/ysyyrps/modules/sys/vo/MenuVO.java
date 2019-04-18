package dzh.ysyyrps.modules.sys.vo;

import dzh.ysyyrps.modules.sys.entity.Menu;

import java.io.Serializable;

public class MenuVO extends Menu implements Serializable {
    private static final long serialVersionUID = 1L;

    private String parentName;

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}
