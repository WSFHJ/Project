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

	// 添加库存商品
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
				System.out.println("添加" + i + "条数据到商品表成功 ");
			} else {
				System.out.println("添加数据失败 ");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(null, statement, connection);
		}
	}

	// 删除库存商品
	@Override
	public void remove(String id) {
		Connection connection = null;
		Statement statement = null;

		try {

			connection = JDBCUntils.getConnection();

			// 3.创建statement 对象
			statement = connection.createStatement();

			// 4.指定sql
			String sql = "delete from goods where number = '" + id + "'";
			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("删除" + i + "条数据成功：");
			} else {
				System.out.println("删除数据失败");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}
	}

	// 查询库存商品
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
				System.out.println("=====================================库存商品如下=====================================");

			} else {
				
				System.out.println("=====================================销售商品如下=====================================");

			}

			System.out.println("商品编号\t商品名称\t商品供应商     商品生产地    商品单位\t商品规格\t商品价格\t商品包装\t商品数量");
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

	// 查询库存是否有此商品
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

	// 输入商品信息
	public void addGoods(good g) {
		Scanner sc = new Scanner(System.in);
		goodsImpl g2 = new goodsImpl();

		while (true) {
			System.out.println("----请输入你要添加的商品编号(number)----");
			String number;
			while (true) {
				number = sc.nextLine();
				if (g2.have(number)) {
					System.out.println("已经存在编号为" + number + "的商品，请重新输入");
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
				System.out.println("输入商品编号不能为字母和不切实际");
				System.out.println("请重新输入商品编号：");
			}
		}

		System.out.println("----请输入你要添加的商品名称(CName)----");
		String CName = sc.nextLine();
		g.setCName(CName);
		System.out.println("----请输入你要添加的商品供应商(supplier)----");
		String supplier = sc.nextLine();
		g.setSupplier(supplier);
		System.out.println("----请输入你要添加的商品生产地(PArea)----");
		String PArea = sc.nextLine();
		g.setPArea(PArea);
		System.out.println("----请输入你要添加的商品单位(unit)----");
		String unit = sc.nextLine();
		g.setUnit(unit);
		System.out.println("----请输入你要添加的商品规格(shelfFife)----");
		String shelfFife = sc.nextLine();
		g.setShelfFife(shelfFife);

		System.out.println("----请输入你要添加的商品包装(pack)----");
		String pack = sc.nextLine();
		g.setPack(pack);

		while (true) {
			System.out.println("----请输入你要添加的商品价格(price)----");
			String price = sc.nextLine();
			// float price = sc.nextFloat();
			String regex = "[0-9]{1,4}";
			if (price.matches(regex)) {
				Float price2 = Float.parseFloat(price);
				g.setPrice(price2);
				break;
			} else {
				System.out.println("输入商品价格不能为字母和不切实际");
				System.out.println("请重新输入商品价格：");
			}
		}

		while (true) {
			System.out.println("----请输入你要添加的商品数量(fullNumber)----");
			String fullNumber = sc.nextLine();
			String regex = "[0-9]{1,4}";
			if (fullNumber.matches(regex)) {
				Float fullNumber2 = Float.parseFloat(fullNumber);
				g.setFullNumber(fullNumber2);
				break;
			} else {
				System.out.println("输入数量不能为字母和不切实际");
				System.out.println("请重新输入商品数量：");
			}
		}

		System.out.println("输入完成");
	}

	// 查询库存的商品数量
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
					System.out.println("对不起，此商品库存仅剩" + resultSet.getFloat("fullNumber") + "件");
					System.out.println("请重新输入数量：");
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

	// 找到对应商品的名字
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

	// 找到对应商品的价格
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

	// 找到库存的商品数量
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
