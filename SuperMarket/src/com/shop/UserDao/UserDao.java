package com.shop.UserDao;

import com.shop.entity.User;

public interface UserDao {
	// �û�ע�᷽��
	public abstract void regesiter(User u);

	// �û���¼����
	public abstract boolean login(String username, String userpassword, String userroot);

	// ��ʾ�����û���Ϣ
	public abstract void showuser();
}
