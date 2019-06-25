package com.gec.model;

public class MenuItem {
	
	private String id;
	private String itemName;  //二级菜单名称
	private String urlLink;   //超级链接
	private String visible;   //可见性
	
	
	
	
	//{ps} 添加构造器
	public MenuItem(String itemName, String urlLink, String visible) {
		this.itemName = itemName;
		this.urlLink = urlLink;
		this.visible = visible;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
		return "MenuItem [id=" + id + ", itemName=" + itemName + ", urlLink=" + urlLink + ", visible=" + visible + "]";
	}
	
}
