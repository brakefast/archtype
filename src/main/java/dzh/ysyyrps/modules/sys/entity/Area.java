/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.entity;

import com.ciocem.common.dao.DataEntity;
import com.drew.lang.annotations.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.github.abel533.echarts.data.Data;
import org.hibernate.validator.constraints.Length;

import com.ciocem.common.dao.TreeEntity;
import org.hibernate.validator.constraints.NotBlank;

import java.util.List;

/**
 * 区域Entity
 *
 * @author tyluo
 * @version 2013-05-15
 */
public class Area extends DataEntity<Area> {

    private static final long serialVersionUID = 1L;
    private String parentIds; // 所有父级编号
    private List<Area> children;    //下级区域
    private String code;    // 区域编码
    private String name;    // 区域名称
    private Integer sort;        // 排序
    private String type;    // 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
    private Integer levelNum;    // 序号
    private String parentId;
    private String parentName;//父节点名称

    public Area() {
        super();
        this.sort = 30;
    }

    public Area(String id) {
        super(id);
    }

    @Length(min = 1, max = 2000)
    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    @Length(min = 1, max = 100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @NotNull
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Length(min = 1, max = 1)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Length(min = 0, max = 100)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String getRemarks() {
        return remarks;
    }

    @Override
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @JsonIgnore
    public static String getRootId() {
        return "0";
    }

    public List<Area> getChildren() {
        return children;
    }

    public void setChildren(List<Area> children) {
        this.children = children;
    }

    public Integer getLevelNum() {
        return levelNum;
    }

    public void setLevelNum(Integer levelNum) {
        this.levelNum = levelNum;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    @JsonIgnore
    public static void sortList(List<Area> list, List<Area> sourcelist, String parentId, boolean cascade){
        for (int i=0; i<sourcelist.size(); i++){
            Area e = sourcelist.get(i);
            if (e.getParentId()!=null && e.getParentId().equals(parentId)){
                list.add(e);
                if (cascade){
                    // 判断是否还有子节点, 有则继续获取子节点
                    for (int j=0; j<sourcelist.size(); j++){
                        Area child = sourcelist.get(j);
                        if (child.getParentId()!=null && child.getParentId().equals(e.getId())){
                            sortList(list, sourcelist, e.getId(), true);
                            break;
                        }
                    }
                }
            }
        }
    }

}