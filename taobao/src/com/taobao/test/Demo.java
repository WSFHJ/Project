package com.taobao.test;

import java.util.Scanner;

import com.taobao.UserDao.UserDao;
import com.taobao.UserDao.Impl.UserDaoImpl;
import com.taobao.entity.User;

public class Demo {
	public static void main(String[] args) {
while(true){
		System.out.println("==========欢迎使用家美园超市系统===========");
		System.out.println("1注册");
		System.out.println("2登录");
		System.out.println("3退出");
		System.out.println("请输入您需要功能的编号:");

		Scanner sc = new Scanner(System.in);
		String change = sc.nextLine();
		// switch 在jdk 1.7新特性中可以使用字符串判断
		switch (change) {
		case "1":
			System.out.println("请输入您要注册的账号:");
			String username = sc.nextLine();
			System.out.println("请输入您要注册的密码:");
			String userpassword = sc.nextLine();

			// 将账号和密码封装成对象
			User u = new User();
			u.setUsername(username);
			u.setUserpassword(userpassword);

			UserDao dao = new UserDaoImpl();
			dao.regesiter(u);
			System.out.println("注册成功");
			break;
		case "2":
			// boolean b = dao.login(username, userpassword);
			System.out.println("请输入您要登录的账号:");
			String newusername = sc.nextLine();
			System.out.println("请输入您要登录的密码:");
			String newuserpassword = sc.nextLine();

			// boolean b = dao.login(newusername, newuserpassword);
			// if(b)
			// {
			//
			// }

			UserDao dao1 = new UserDaoImpl();
			if (dao1.login(newusername, newuserpassword)) {
				System.out.println("用户登录成功~~");
				// break;
				// return;
				// 强制关闭jvm虚拟机

				// 玩游戏
				// Game.statrt();
				System.exit(1);
			} else {
				System.out.println("用户登录失败!");
			}
			break;
		case "3":
			System.out.println("谢谢光临，下次再见！");
			System.exit(1);
			break;
		default:
			break;
		}

}		
	}

}
