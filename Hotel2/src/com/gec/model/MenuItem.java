package com.gec.model;

public class MenuItem {
	
	private String id;
	private String itemName;  //�����˵�����
	private String urlLink;   //��������
	private String visible;   //�ɼ���
	
	
	
	
	//{ps} ��ӹ�����
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
