package com.shop.test;

import java.util.Scanner;

import com.shop.Controller.goods;
import com.shop.Controller.Impl.ControllerImpl;
import com.shop.Controller.Impl.goodsImpl;
import com.shop.UserDao.UserDao;
import com.shop.UserDao.Impl.UserDaoImpl;
import com.shop.entity.User;
import com.shop.salesman.Impl.SalesmanImpl;

public class Demo {
	public static void main(String[] args) {
		System.out.println("--------------欢迎来到家美园超市管理系统----------------");
		while (true) {
			System.out.println("1注册");
			System.out.println("2登录");
			System.out.println("3退出");

			System.out.println("请输入您需要功能的编号:");

			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			switch (change) {
			case "1":
				while (true) {
					System.out.println("请输入您要注册的账号:");
					String username = sc.nextLine();
					System.out.println("请输入您要注册的密码:");
					String userpassword = sc.nextLine();
					System.out.println("管理员请输入root，销售员请输入user: ");
					System.out.println("(输入其他字符,默认为user)");
					String userroot = sc.nextLine();

					// 将账号和密码封装成对象
					User u = new User();
					u.setUsername(username);
					u.setUserpassword(userpassword);
					u.setUserroot(userroot);

					UserDaoImpl dao = new UserDaoImpl();
					if (dao.login2(u.getUsername(), u.getUserroot())) {
						System.out.println("用户已存在,请重新注册");
						System.out.println();
					} else {
						dao.regesiter(u);
						System.out.println("注册成功");
						System.out.println();
						break;
					}
				}

				break;
			case "2":
				System.out.println("请输入您要登录的账号:");
				String newusername = sc.nextLine();
				System.out.println("请输入您要登录的密码:");
				String newuserpassword = sc.nextLine();
				System.out.println("管理员请输入root，销售员请输入user: ");
				System.out.println("(输入其他字符,默认为user)");
				String newuserroot = sc.nextLine();

				UserDao dao1 = new UserDaoImpl();
				goods g = new goodsImpl();
				if (dao1.login(newusername, newuserpassword, newuserroot)) {
					System.out.println("用户登录成功~~");
					System.out.println();
					if (newuserroot.equals("root")) {
						System.out.println("欢迎" + newusername + "来到管理员界面：");
						
						ControllerImpl c = new ControllerImpl();
						User u2 = new User();
						u2.setUsername(newusername);
						u2.setUserpassword(newuserpassword);
						u2.setUserroot(newuserroot);
						c.operate(u2);

						break;
					} else {
						System.out.println("欢迎" + newusername + "来到销售员界面：");
						SalesmanImpl c = new SalesmanImpl();
						User u2 = new User();
						u2.setUsername(newusername);
						u2.setUserpassword(newuserpassword);
						u2.setUserroot(newuserroot);
						g.find(u2);// 商品表显示
						c.operate(u2);
						break;
					}
				} else {
					System.out.println("用户登录失败! 账号或者密码或者权限写错!");
					System.out.println();
				}
				break;

			case "3":
				System.out.println("希望你使用系统愉快，下次再见");
				System.exit(1);
				break;

			default:
				System.out.println("输入错误，请重新选择功能");
				break;
			}

		}

	}

}
