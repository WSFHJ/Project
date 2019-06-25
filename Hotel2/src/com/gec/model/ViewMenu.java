package com.gec.model;

public class ViewMenu {
	
	private String roleId;
	private String menuId;
	private String menuName;
	private String menuItemId;
	private String itemName;
	private String urlLink;
	private String visible;

	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuItemId() {
		return menuItemId;
	}
	public void setMenuItemId(String menuItemId) {
		this.menuItemId = menuItemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getUrlLink() {
		return urlLink;
	}
	public void setUrlLink(String urlLink) {
		this.urlLink = urlLink;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	
	@Override
	public String toString() {
		return "ViewMenu [roleId=" + roleId + ", menuId=" + menuId + ", menuName=" + menuName + ", menuItemId="
				+ menuItemId + ", itemName=" + itemName + ", urlLink=" + urlLink + ", visible=" + visible + "]";
	}
	
}
