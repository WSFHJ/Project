package com.taobao.UserDao;

import com.taobao.entity.User;

public interface UserDao {
	
	
	// 在真正的web项目中，注册的返回值不能定义成这样子
	
	/**
	 * @author newuser
	 * 用户注册方法
	 * @param u 用户的个人信息
	 */
 public abstract void regesiter(User u);
 
 
 /**
  * 用户登录
  * @param username
  * @param userpassword
  * @return
  */
 public abstract boolean login(String username,String userpassword);
}
