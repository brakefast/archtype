package dzh.ysyyrps.modules.sys.vo;

import dzh.ysyyrps.modules.sys.entity.Dict;
import java.io.Serializable;
import java.util.List;

public class DictVO extends Dict implements Serializable {
    private static final long serialVersionUID = 1L;
    private List<String> moduleParentIds; //根据模块 过滤字典
    private String selectedDictId;//选中字典ID
    private String editTag; //树编辑标识
    private String delType; //删除标识
    private String checkOnlyTag; //唯一性校验标识
    private String dangerEvaluateTag; //危险源界面标识

    public List<String> getModuleParentIds() {
        return moduleParentIds;
    }

    public void setModuleParentIds(List<String> moduleParentIds) {
        this.moduleParentIds = moduleParentIds;
    }

    public String getSelectedDictId() {
        return selectedDictId;
    }

    public void setSelectedDictId(String selectedDictId) {
        this.selectedDictId = selectedDictId;
    }

    public String getEditTag() {
        return editTag;
    }

    public void setEditTag(String editTag) {
        this.editTag = editTag;
    }

    public String getDelType() {
        return delType;
    }

    public void setDelType(String delType) {
        this.delType = delType;
    }

    public String getCheckOnlyTag() {
        return checkOnlyTag;
    }

    public void setCheckOnlyTag(String checkOnlyTag) {
        this.checkOnlyTag = checkOnlyTag;
    }

    public String getDangerEvaluateTag() {
        return dangerEvaluateTag;
    }

    public void setDangerEvaluateTag(String dangerEvaluateTag) {
        this.dangerEvaluateTag = dangerEvaluateTag;
    }
}
