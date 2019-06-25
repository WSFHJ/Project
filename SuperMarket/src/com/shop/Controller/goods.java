package com.shop.Controller;

import com.shop.entity.User;

public interface goods {
	// 添加库存商品
	public abstract void add();

	// 删除库存商品
	public abstract void remove(String id);

	// 查询库存商品
	public abstract void find(User u);

}
