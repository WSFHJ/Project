package com.taobao.UserDao;

import com.taobao.entity.User;

public interface UserDao {
	
	
	// ��������web��Ŀ�У�ע��ķ���ֵ���ܶ����������
	
	/**
	 * @author newuser
	 * �û�ע�᷽��
	 * @param u �û��ĸ�����Ϣ
	 */
 public abstract void regesiter(User u);
 
 
 /**
  * �û���¼
  * @param username
  * @param userpassword
  * @return
  */
 public abstract boolean login(String username,String userpassword);
}
