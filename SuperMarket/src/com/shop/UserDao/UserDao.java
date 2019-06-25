package com.shop.UserDao;

import com.shop.entity.User;

public interface UserDao {
	// 用户注册方法
	public abstract void regesiter(User u);

	// 用户登录方法
	public abstract boolean login(String username, String userpassword, String userroot);

	// 显示所有用户信息
	public abstract void showuser();
}
