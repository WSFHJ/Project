package com.gec.model;

public class User {
	
	private int id;
	private String account;
	private String name;
	private String pass;
	private String roleId;
	private String roleName;
	
	private String createDate;
	

	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", name=" + name + ", pass=" + pass + ", roleId=" + roleId
				+ ", roleName=" + roleName + ", createDate=" + createDate + "]";
	}
	
}
