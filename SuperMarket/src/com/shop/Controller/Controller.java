package com.shop.Controller;

import com.shop.entity.User;

public interface Controller {
	// 人员管理删除
	public abstract void delete(String name, String root);

	// 个人信息修改
	public abstract void change(User u, String message, String mess);

	// 进货管理
	public abstract void manage(User u);

}
