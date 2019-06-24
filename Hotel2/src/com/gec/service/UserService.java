package com.gec.service;

import java.util.Map;

import com.gec.dao.MenuDao;
import com.gec.dao.UserDao;
import com.gec.model.Menu;
import com.gec.model.Page;
import com.gec.model.User;

public class UserService {
	UserDao userDao = new UserDao();
	MenuDao menuDao = new MenuDao();
	
	public User doLogin(User user) {
		return userDao.validateUser(user.getAccount(), user.getPass());
	}
	
	/*
		����: �ý�ɫ�˵�
		Map<String,Menu> getRoleMenus(String roleId);    
		����: menuDao.getRoleMenuMap();
	 */
	public Map<String,Menu> getRoleMenus(String roleId){
		return menuDao.getRoleMenuMap( roleId );
	}

	/*
		Map<String,String> getAuthority(String roleId);  �ý�ɫȨ��
		����: menuDao.getRoleAuthrity();
	*/
	
	
	public Page<User> getUserList(Page page){
		return userDao.getUserList(page);
	}
	
	public int saveUser(User user){	
		int i = userDao.saveUsers(user);
		return i;
	}

	public int delUser(User user) {
		int i = userDao.delUsers(user);
		return i;
	}

//	public int delUser(String name) {
//		int i = userDao.delUsers(name);
//		return 0;
//	}

}
