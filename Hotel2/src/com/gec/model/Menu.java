package com.gec.model;

import java.util.LinkedHashSet;
import java.util.Set;

public class Menu {
	
	private String id;
	private String menuName;
	private int locked;
	private String descript;
	
	 //{ps}必须保证是有序的 (迭代时与插入时的顺序一致)
	private Set<MenuItem> items = new LinkedHashSet(); 
	
	
	
	
	//{ps} 添加有参构造器
	public Menu(String id, String menuName){
		this.id = id;
		this.menuName = menuName;
	}	
	//{ps} 添加方法(用作添加 MenuItem 对象)
	public void addMenuItem(MenuItem item){
		this.items.add( item );
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getLocked() {
		return locked;
	}
	public void setLocked(int locked) {
		this.locked = locked;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public Set<MenuItem> getItems() {
		return items;
	}
	public void setItems(Set<MenuItem> items) {
		this.items = items;
	}
	
	@Override
	public String toString() {
		return "Menu [id=" + id + ", menuName=" + menuName + ", locked=" + locked + ", descript=" + descript
				+ "]";
	}
}
