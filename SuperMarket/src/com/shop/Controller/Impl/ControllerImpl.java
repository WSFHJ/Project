package com.shop.Controller.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import org.junit.Test;

import com.shop.Controller.Controller;
import com.shop.Controller.goods;
import com.shop.JDBC.JDBCUntils;
import com.shop.UserDao.UserDao;
import com.shop.UserDao.Impl.UserDaoImpl;
import com.shop.entity.User;

public class ControllerImpl implements Controller {
	// 管理员界面
	public void operate(User u) {
		
		while (true) {
			
			UserDao dao1 = new UserDaoImpl();
			dao1.showuser();// 用户表显示
			
			System.out.println("------可以进行的操作---------");
			System.out.println("1.人员管理删除");
			System.out.println("2.用户注册");
			System.out.println("3.个人信息修改(包括密码修改)");
			System.out.println("4.进货管理");
			System.out.println("5.退出当前系统");
		
			System.out.println("---------请选择操作---------");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			switch (change) {
			case "1":
				while (true) {
					
					System.out.println("输入删除用户的权限：");
					String root = sc.nextLine();
					System.out.println("输入删除用户名：");
					String name = sc.nextLine();

					Controller c = new ControllerImpl();
					UserDaoImpl dao = new UserDaoImpl();
					if (dao.login2(u.getUsername(), u.getUserroot())) {
						c.delete(root, name);
						break;
					} else {
						System.out.println("输入的用户不存在,请重新输入");
						System.out.println();
					}

				}
				break;

			case "2":
				while (true) {

					System.out.println("请输入您要注册的账号:");
					String username = sc.nextLine();
					System.out.println("请输入您要注册的密码:");
					String userpassword = sc.nextLine();
					System.out.println("管理员请输入root，销售员请输入user: ");
					System.out.println("(输入其他字符,默认为user)");
					String userroot = sc.nextLine();

					// 将账号和密码封装成对象
					User u2 = new User();
					u2.setUsername(username);
					u2.setUserpassword(userpassword);
					u2.setUserroot(userroot);

					UserDaoImpl dao = new UserDaoImpl();
					if (dao.login2(u2.getUsername(),u2.getUserroot() )) {
						System.out.println("用户已存在,请重新注册");
					} else {
						dao.regesiter(u2);
						System.out.println("注册成功");
						System.out.println();
						break;
					}
					
				}

				break;

			case "3":
				System.out.println("你的用户名是：" + u.getUsername());
				System.out.println("你的密码是：" + u.getUsername());
				System.out.println("你的密码是：" + u.getUserroot());

				String message;
				while (true) {
					System.out.println("你要修改的一项是什么");
					message = sc.nextLine();
					if (message.equals("user") || message.equals("password") || message.equals("power")) {
						System.out.println("你要修改的是" + message);
						break;
					} else {
						System.out.println("输入错误，只能输入user或者password或者power");
					}
				}

				System.out.println("改成什么");
				String mess = sc.nextLine();
				ControllerImpl c1 = new ControllerImpl();
				c1.change(u, message, mess);
				break;

			case "4":

				manage(u);
				break;

			case "5":
				System.out.println("成功由管理员界面退出");
				System.exit(1);
				break;

			default:
				System.out.println("输入错误，请重新选择功能");
				break;
			}
		}
	}

	// 删除数据
	@Override
	// @Test
	public void delete(String root, String name) {
		Connection connection = null;
		Statement statement = null;
		int i;

		try {
			connection = JDBCUntils.getConnection();

			// 3.创建statement 对象
			statement = connection.createStatement();

			String sql;
			if (root.equals("root")) {
				sql = "delete from controller where user = '" + name + "'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("删除管理员表" + i + "条数据成功：");

					sql = "delete from person where user = '" + name + "' and power = 'root'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("删除用户表" + i + "条数据成功：");
						System.out.println();
					} else {
						System.out.println("用户表没有该用户");
					}

				} else {
					System.out.println("删除数据失败,用户名或权限输入错误");
				}

			} else if (root.equals("user")) {
				sql = "delete from salesman where user = '" + name + "'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("删除销售员表" + i + "条数据成功：");

					sql = "delete from person where user = '" + name + "' and power = 'user'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("删除用户表" + i + "条数据成功：");
						System.out.println();
					} else {
						System.out.println("用户表没有该用户");
					}

				} else {
					System.out.println("删除数据失败,用户名或权限输入错误");
				}
			} else {
				System.out.println("权限或用户名输入错误,权限只能为root或user");
				System.out.println();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}
	}

	// 改变个人信息
	@Override
	public void change(User u, String message, String mess) {
		Connection connection = null;
		Statement statement = null;
		int i;

		try {
			connection = JDBCUntils.getConnection();

			// 3.创建statement 对象
			statement = connection.createStatement();

			String sql;
			if (u.getUserroot().equals("root")) {
				sql = "update controller set " + message + " = '" + mess + "'where user = '" + u.getUsername() + "'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("修改管理员表" + i + "条数据成功：");

					sql = "update person set " + message + " = '" + mess + "'where user = '" + u.getUsername()
							+ "'and power = 'root'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("修改用户表" + i + "条数据成功：");
						System.out.println();
					} else {
						System.out.println("修改数据失败");
					}

				} else {
					System.out.println("修改数据失败");
				}

			} else if (u.getUserroot().equals("user")) {
				sql = "update salesman set " + message + " = '" + mess + "'where user = '" + u.getUsername()
						+ "'and power = 'user'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("修改销售员表" + i + "条数据成功：");

					sql = "update person set " + message + " = '" + mess + "'where user = '" + u.getUsername()
							+ "'and power = 'user'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("修改用户表" + i + "条数据成功：");
						System.out.println();
					} else {
						System.out.println("修改数据失败");
					}

				} else {
					System.out.println("修改数据失败");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}
	}

	// 进货管理
	// @Test
	@Override
	public void manage(User u) {
		System.out.println("---------进货管理---------");
		while (true) {
			System.out.println("1.添加库存商品");
			System.out.println("2.删除库存商品");
			System.out.println("3.查询库存商品");
			System.out.println("4.退出进货管理页面");

			System.out.println("请选择你要的功能：");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			goods g = new goodsImpl();
			goodsImpl g2 = new goodsImpl();

			switch (change) {
			case "1":
				g.add();
				break;

			case "2":
				System.out.println("----请输入你要删除的商品的编号(id)----");
				String id;
				while (true) {
					id = sc.nextLine();
					String regex = "[0-9]{1,4}";
					if (id.matches(regex)) {
						System.out.println("你要删除的商品的编号是" + id);
						if (g2.have(id)) {
							break;
						} else {
							System.out.println("没有编号为" + id + "商品,请重新输入");
						}
					} else {
						System.out.println("输入商品编号不正确,重新输入");
					}
				}
				g.remove(id);

				break;

			case "3":
				g.find(u);
				break;

			case "4":
				System.out.println("由进货管理页面退出");
				System.exit(1);

			default:
				System.out.println("输入功能选择错误");
				break;
			}
		}
	}

}
