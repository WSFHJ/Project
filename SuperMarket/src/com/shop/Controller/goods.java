package com.shop.Controller;

import com.shop.entity.User;

public interface goods {
	// ��ӿ����Ʒ
	public abstract void add();

	// ɾ�������Ʒ
	public abstract void remove(String id);

	// ��ѯ�����Ʒ
	public abstract void find(User u);

}
