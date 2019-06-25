package com.shop.salesman.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.function.Predicate;

import org.junit.Test;

import com.shop.Controller.Impl.goodsImpl;
import com.shop.JDBC.JDBCUntils;
import com.shop.salesman.BuyGoods;

public class BuyGoodsImpl implements BuyGoods {

	// 添加销售商品

	@Override
	public void buyadd(String id, String fullNumber) {
		
		String fullNumber2 = String.valueOf(fullNumber);
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		goodsImpl g = new goodsImpl();
		String CName = g.find2(id);
		String price = g.find3(id);

		try {
			connection = JDBCUntils.getConnection();

			// 3.创建statement 对象
			statement = connection.createStatement();

			// 4.指定sql
			sql = "insert into buy value('" + id + "','" + CName + "','" + price + "','" + fullNumber2 + "')";
			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("购物车添加商品成功：" + i);
			} else {
				System.out.println("购物车添加商品失败：" + i);
			}


		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(null, statement, connection);
		}
	}

	// 删除销售商品
	@Override
	public void buydelete(String id) {
		Connection connection = null;
		Statement statement = null;

		try {
			connection = JDBCUntils.getConnection();

			// 3.创建statement 对象
			statement = connection.createStatement();

			// 4.指定sql
			String sql = "delete from buy where number = '" + id + "'";
			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("删除商品成功：" + i);
			} else {
				System.out.println("删除商品失败：" + i);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}

	}

	// 结账销售商品
	@Override
	public boolean buysale() {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;
		float fullNumber = 0;
		float price = 0;
		float sum = 0;
		float pSum = 0;
		boolean i = false;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			System.out.println("===========================你添加的商品如下：===========================");
			System.out.println("商品编号\t商品名称\t商品价格\t商品数量");	
			System.out.println("----------------------------------------------------------------------");

			sql = "select * from buy";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				String number = resultSet.getString("number");
				String CName = resultSet.getString("CName");
				price = resultSet.getFloat("price");
				fullNumber = resultSet.getFloat("fullNumber");

				System.out.println(number + "\t" + CName + "\t" + price + "\t" + fullNumber);

				sum = price * fullNumber;
				pSum += sum;
			}
			if (pSum==0) {
				System.out.println("你没添加任何商品，你可以去看看");
				System.out.println();
				i = false;
			}else{
			    System.out.println("结账之后，你要付的钱是：" + pSum);
			    i = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return i;
	}

	// 判断buy表有没有相应的物品
	public boolean have3(String id) {
		Boolean i = null;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			sql = "select number from buy";
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

	// 结账小票
	public void buysale2() {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String sql = null;
		float fullNumber = 0;
		float price = 0;
		float sum = 0;
		float pSum = 0;

		try {
			connection = JDBCUntils.getConnection();
			statement = connection.createStatement();

			System.out.println("===========================你购买的商品如下：===========================");
			System.out.println("----------------------------------------------------------------------");

			System.out.println("商品编号\t商品名称\t商品价格\t商品数量");

			sql = "select * from buy";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				String number = resultSet.getString("number");
				String CName = resultSet.getString("CName");
				price = resultSet.getFloat("price");
				fullNumber = resultSet.getFloat("fullNumber");

				System.out.println(number + "\t" + CName + "\t" + price + "\t" + fullNumber);

				sum = price * fullNumber;
				pSum += sum;
				

            //库存减
			kuDelete(number,fullNumber);
			
			}
			
			System.out.println("你付的钱是：" + pSum + ",这是小票，请收好");
			
			biaoDelete();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
	}
	
	//库存减
	public void kuDelete(String number,Float fullNumber){
		Connection connection=null;
		Statement statement = null;
		
		try {
			connection = JDBCUntils.getConnection();
			
			//3.创建statement 对象
			statement = connection.createStatement();
			
			goodsImpl g = new goodsImpl();
			float n = g.find4(number) - fullNumber;
					
			//4.指定sql
			String sql = "update goods set fullNumber = '" + n + "'where number = '" + number + "'";
			int i = statement.executeUpdate(sql);
			if(i>0){
				
			}else{
				
			}
			
		} catch (Exception e) {	
			e.printStackTrace();
		}finally{
			
			JDBCUntils.Close(null, statement, connection);
			
		}
	}

	//清空buy表
	public void biaoDelete(){
		Connection connection=null;
		Statement statement = null;
		
		try {
			connection = JDBCUntils.getConnection();
			
			//3.创建statement 对象
			statement = connection.createStatement();
					
			//4.指定sql
			String sql = "delete from buy";
			int i = statement.executeUpdate(sql);
			if(i>0){
				
			}else{
				
			}
			
		} catch (Exception e) {	
			e.printStackTrace();
		}finally{
			
			JDBCUntils.Close(null, statement, connection);
			
		}
	}
}
