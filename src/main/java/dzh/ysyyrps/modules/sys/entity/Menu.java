/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.entity;


import com.ciocem.common.dao.DataEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 系统菜单Entity
 * @author tyluo
 * @version 2017-04-25
 */
public class Menu extends DataEntity<Menu> {
	private static final long serialVersionUID = 1L;
	private String parentId;		// 父级菜单
	private String parentIds;		// 所有父级菜单
	private String menuNo;		// 菜单编号
	private String name;		// 名称
	private String aliasName;		// 别名
	private Integer levelNum;		// 序号
	private String type;		// 类型
	private Integer sort;		// 排序号
	private String href;		// 链接地址
	private String target;		// 目标
	private String icon;		// 图标
	private String isShow;		// 是否显示
	private String rightId;		// 权限
	private String permission;		// 权限标识
	private String moduleNo;		// 模块编号
	private String groupNo;
	
	public Menu() {
		super();
	}

	public Menu(String id){
		super(id);
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	public String getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAliasName() {
		return aliasName;
	}

	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}
	
	public Integer getLevelNum() {
		return levelNum;
	}

	public void setLevelNum(Integer levelNum) {
		this.levelNum = levelNum;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
	
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	
	public String getRightId() {
		return rightId;
	}

	public void setRightId(String rightId) {
		this.rightId = rightId;
	}
	
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	public String getModuleNo() {
		return moduleNo;
	}

	public void setModuleNo(String moduleNo) {
		this.moduleNo = moduleNo;
	}
	
	@JsonIgnore
	public static String getRootId(){
		return "0";
	}

	public String getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
}