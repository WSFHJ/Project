package com.shop.UserDao.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import org.junit.Test;

import com.shop.JDBC.JDBCUntils;
import com.shop.UserDao.UserDao;
import com.shop.entity.User;

public class UserDaoImpl implements UserDao {
	// 用户注册方法
	@Override
	public void regesiter(User u) {

		Connection connection = null;
		Statement statement = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			String sql = "insert into person value('" + u.getUsername() + "','" + u.getUserpassword() + "','"
					+ u.getUserroot() + "');";

			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("添加" + i + "条数据到用户表成功 ");
			} else {
				System.out.println("添加数据失败 " + i);
			}

			if (u.getUserroot().equals("root")) {
				sql = "insert into controller value('" + u.getUsername() + "','" + u.getUserpassword() + "','"
						+ u.getUserroot() + "');";

				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("添加" + i + "条数据到管理员表成功 ");
				} else {
					System.out.println("添加数据失败 " + i);
				}

			} else if (u.getUserroot().equals("user")) {
				sql = "insert into salesman value('" + u.getUsername() + "','" + u.getUserpassword() + "','"
						+ u.getUserroot() + "');";

				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("添加" + i + "条数据到销售员表成功 ");
				} else {
					System.out.println("添加数据失败 " + i);
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(null, statement, connection);
		}
	}

	// 用户登录方法
	@Override
	public boolean login(String username, String userpassword, String userroot) {

		boolean i = false;

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			String sql;
			if (userroot.equals("root")) {
				sql = "select * from controller";
			} else {
				sql = "select * from salesman";
				userroot = "user";
			}

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (resultSet.getString("user").equals(username) && resultSet.getString("password").equals(userpassword)
						&& resultSet.getString("power").equals(userroot)) {
					i = true;
					break;

				} else {
					i = false;
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return i;

	}

	// 显示所有用户信息
	@Override
	public void showuser() {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			System.out.println("=========管理人员如下=========");
			System.out.println("用户名\t密码\t权限");
			System.out.println("-----------------------------");

			sql = "select * from controller";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				String user = resultSet.getString("user");
				String password = resultSet.getString("password");
				String power = resultSet.getString("power");

				System.out.println(user + "\t" + password + "\t" + power);
			}

			System.out.println();

			System.out.println("=========销售人员如下=========");
			System.out.println("用户名\t密码\t权限");
			System.out.println("-----------------------------");

			sql = "select * from salesman";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				String user = resultSet.getString("user");
				String password = resultSet.getString("password");
				String power = resultSet.getString("power");

				System.out.println(user + "\t" + password + "\t" + power);
			}
			
			System.out.println();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
	}

	//判断是否存在
	public boolean login2(String username, String userroot) {

		boolean i = false;

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			String sql;
			if (userroot.equals("root")) {
				sql = "select * from controller";
			} else {
				sql = "select * from salesman";
				userroot = "user";
			}

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (resultSet.getString("user").equals(username) && resultSet.getString("power").equals(userroot)) {
//					System.out.println("输入的用户存在");
					i = true;
					break;

				} else {
//					System.out.println("输入的用户不存在");
					i = false;
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return i;

	}
}
