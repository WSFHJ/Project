package com.shop.entity;

public class User {
	private String username;
	private String userpassword;
	private String userroot;

	public String getUserroot() {
		return userroot;
	}

	public void setUserroot(String userroot) {
		if (userroot.equals("root") || userroot.equals("user")) {
			this.userroot = userroot;
		} else {
			this.userroot = "user";
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

}
