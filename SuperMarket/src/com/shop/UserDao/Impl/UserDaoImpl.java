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
	// �û�ע�᷽��
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
				System.out.println("���" + i + "�����ݵ��û���ɹ� ");
			} else {
				System.out.println("�������ʧ�� " + i);
			}

			if (u.getUserroot().equals("root")) {
				sql = "insert into controller value('" + u.getUsername() + "','" + u.getUserpassword() + "','"
						+ u.getUserroot() + "');";

				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("���" + i + "�����ݵ�����Ա��ɹ� ");
				} else {
					System.out.println("�������ʧ�� " + i);
				}

			} else if (u.getUserroot().equals("user")) {
				sql = "insert into salesman value('" + u.getUsername() + "','" + u.getUserpassword() + "','"
						+ u.getUserroot() + "');";

				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("���" + i + "�����ݵ�����Ա��ɹ� ");
				} else {
					System.out.println("�������ʧ�� " + i);
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(null, statement, connection);
		}
	}

	// �û���¼����
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

	// ��ʾ�����û���Ϣ
	@Override
	public void showuser() {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			System.out.println("=========������Ա����=========");
			System.out.println("�û���\t����\tȨ��");
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

			System.out.println("=========������Ա����=========");
			System.out.println("�û���\t����\tȨ��");
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

	//�ж��Ƿ����
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
//					System.out.println("������û�����");
					i = true;
					break;

				} else {
//					System.out.println("������û�������");
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
