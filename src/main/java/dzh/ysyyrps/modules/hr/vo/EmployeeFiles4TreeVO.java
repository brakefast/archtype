package dzh.ysyyrps.modules.hr.vo;

import java.io.Serializable;

/**
 * Created by @author fzhang
 *
 * @create 2018/10/15.
 */
public class EmployeeFiles4TreeVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String pId;
    private String name;
    private Boolean open;
    private String nType;//0 部门  1 组织  2 员工
    private String cno;//员工编号
    private Boolean checked;
    private String searchId;
    private String vacationId;

    public String getVacationId() {
        return vacationId;
    }

    public void setVacationId(String vacationId) {
        this.vacationId = vacationId;
    }

    public String getSearchId() {
        return searchId;
    }

    public void setSearchId(String searchId) {
        this.searchId = searchId;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public String getnType() {
        return nType;
    }

    public void setnType(String nType) {
        this.nType = nType;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }
}
