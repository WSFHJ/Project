package com.shop.Controller.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import org.junit.Test;

import com.shop.Controller.goods;
import com.shop.JDBC.JDBCUntils;
import com.shop.entity.User;
import com.shop.entity.good;

public class goodsImpl implements goods {

	// ��ӿ����Ʒ
	// @Test
	@Override
	public void add() {
		good g = new good();
		addGoods(g);

		Connection connection = null;
		Statement statement = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			String sql = "insert into goods value('" + g.getNumber() + "','" + g.getCName() + "','" + g.getSupplier()
					+ "'," + "'" + g.getPArea() + "','" + g.getUnit() + "','" + g.getShelfFife() + "','" + g.getPrice()
					+ "','" + g.getPack() + "'," + "'" + g.getFullNumber() + "');";

			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("���" + i + "�����ݵ���Ʒ��ɹ� ");
			} else {
				System.out.println("�������ʧ�� ");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(null, statement, connection);
		}
	}

	// ɾ�������Ʒ
	@Override
	public void remove(String id) {
		Connection connection = null;
		Statement statement = null;

		try {

			connection = JDBCUntils.getConnection();

			// 3.����statement ����
			statement = connection.createStatement();

			// 4.ָ��sql
			String sql = "delete from goods where number = '" + id + "'";
			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("ɾ��" + i + "�����ݳɹ���");
			} else {
				System.out.println("ɾ������ʧ��");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}
	}

	// ��ѯ�����Ʒ
	@Override
//	 @Test
	public void find(User u) {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			if (u.getUserroot().equals("root")) {
                System.out.println();
				System.out.println("=====================================�����Ʒ����=====================================");

			} else {
				
				System.out.println("=====================================������Ʒ����=====================================");

			}

			System.out.println("��Ʒ���\t��Ʒ����\t��Ʒ��Ӧ��     ��Ʒ������    ��Ʒ��λ\t��Ʒ���\t��Ʒ�۸�\t��Ʒ��װ\t��Ʒ����");
			System.out.println("-----------------------------------------------------------------------------------------");

			sql = "select * from goods";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				String number = resultSet.getString("number");
				String CName = resultSet.getString("CName");
				String supplier = resultSet.getString("supplier");
				String PArea = resultSet.getString("PArea");
				String unit = resultSet.getString("unit");
				String shelfFife = resultSet.getString("shelfFife");
				float price = resultSet.getFloat("price");
				String pack = resultSet.getString("pack");
				float fullNumber = resultSet.getFloat("fullNumber");

				System.out.println(number + "\t" + CName + "\t" + supplier + "     " + PArea + "        " + unit
						+ "\t" + shelfFife + "\t" + price + "\t" + pack + "\t" + fullNumber);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
	}

	// ��ѯ����Ƿ��д���Ʒ
	// @Test
	public boolean have(String id) {
		Boolean i = null;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			sql = "select * from goods";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				if (id.equals(resultSet.getString("number"))) {
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

	// ������Ʒ��Ϣ
	public void addGoods(good g) {
		Scanner sc = new Scanner(System.in);
		goodsImpl g2 = new goodsImpl();

		while (true) {
			System.out.println("----��������Ҫ��ӵ���Ʒ���(number)----");
			String number;
			while (true) {
				number = sc.nextLine();
				if (g2.have(number)) {
					System.out.println("�Ѿ����ڱ��Ϊ" + number + "����Ʒ������������");
				} else {
					break;
				}
			}

			g.setNumber(number);
			String regex = "[0-9]{1,4}";
			if (number.matches(regex)) {
				g.setNumber(number);
				break;
			} else {
				System.out.println("������Ʒ��Ų���Ϊ��ĸ�Ͳ���ʵ��");
				System.out.println("������������Ʒ��ţ�");
			}
		}

		System.out.println("----��������Ҫ��ӵ���Ʒ����(CName)----");
		String CName = sc.nextLine();
		g.setCName(CName);
		System.out.println("----��������Ҫ��ӵ���Ʒ��Ӧ��(supplier)----");
		String supplier = sc.nextLine();
		g.setSupplier(supplier);
		System.out.println("----��������Ҫ��ӵ���Ʒ������(PArea)----");
		String PArea = sc.nextLine();
		g.setPArea(PArea);
		System.out.println("----��������Ҫ��ӵ���Ʒ��λ(unit)----");
		String unit = sc.nextLine();
		g.setUnit(unit);
		System.out.println("----��������Ҫ��ӵ���Ʒ���(shelfFife)----");
		String shelfFife = sc.nextLine();
		g.setShelfFife(shelfFife);

		System.out.println("----��������Ҫ��ӵ���Ʒ��װ(pack)----");
		String pack = sc.nextLine();
		g.setPack(pack);

		while (true) {
			System.out.println("----��������Ҫ��ӵ���Ʒ�۸�(price)----");
			String price = sc.nextLine();
			// float price = sc.nextFloat();
			String regex = "[0-9]{1,4}";
			if (price.matches(regex)) {
				Float price2 = Float.parseFloat(price);
				g.setPrice(price2);
				break;
			} else {
				System.out.println("������Ʒ�۸���Ϊ��ĸ�Ͳ���ʵ��");
				System.out.println("������������Ʒ�۸�");
			}
		}

		while (true) {
			System.out.println("----��������Ҫ��ӵ���Ʒ����(fullNumber)----");
			String fullNumber = sc.nextLine();
			String regex = "[0-9]{1,4}";
			if (fullNumber.matches(regex)) {
				Float fullNumber2 = Float.parseFloat(fullNumber);
				g.setFullNumber(fullNumber2);
				break;
			} else {
				System.out.println("������������Ϊ��ĸ�Ͳ���ʵ��");
				System.out.println("������������Ʒ������");
			}
		}

		System.out.println("�������");
	}

	// ��ѯ������Ʒ����
	public boolean have2(String id, String fullNumber) {
		Boolean i = null;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			sql = "select * from goods where number ='" + id + "'";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				if (fullNumber.equals(resultSet.getString("fullNumber"))
						|| (Integer.parseInt(fullNumber) < resultSet.getInt("fullNumber"))
								&& (Integer.parseInt(fullNumber) > 0)) {
					i = true;
					break;
				} else {
					System.out.println("�Բ��𣬴���Ʒ����ʣ" + resultSet.getFloat("fullNumber") + "��");
					System.out.println("����������������");
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

	// �ҵ���Ӧ��Ʒ������
	public String find2(String id) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;
		String CName = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			sql = "select CName from goods where number = '" + id + "'";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				CName = resultSet.getString("CName");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return CName;
	}

	// �ҵ���Ӧ��Ʒ�ļ۸�
	public String find3(String id) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;
		String price = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			sql = "select price from goods where number = '" + id + "'";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				price = resultSet.getString("price");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return price;
	}

	// �ҵ�������Ʒ����
	public float find4(String id) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		float fullNumber = 0;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			String sql = "select fullNumber from goods where number ='" + id + "'";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				fullNumber = resultSet.getFloat("fullNumber");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return fullNumber;
	}

}
