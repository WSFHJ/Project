package com.shop.Controller;

import com.shop.entity.User;

public interface Controller {
	// ��Ա����ɾ��
	public abstract void delete(String name, String root);

	// ������Ϣ�޸�
	public abstract void change(User u, String message, String mess);

	// ��������
	public abstract void manage(User u);

}
