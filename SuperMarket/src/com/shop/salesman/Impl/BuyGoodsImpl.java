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

	// ���������Ʒ

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

			// 3.����statement ����
			statement = connection.createStatement();

			// 4.ָ��sql
			sql = "insert into buy value('" + id + "','" + CName + "','" + price + "','" + fullNumber2 + "')";
			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("���ﳵ�����Ʒ�ɹ���" + i);
			} else {
				System.out.println("���ﳵ�����Ʒʧ�ܣ�" + i);
			}


		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(null, statement, connection);
		}
	}

	// ɾ��������Ʒ
	@Override
	public void buydelete(String id) {
		Connection connection = null;
		Statement statement = null;

		try {
			connection = JDBCUntils.getConnection();

			// 3.����statement ����
			statement = connection.createStatement();

			// 4.ָ��sql
			String sql = "delete from buy where number = '" + id + "'";
			int i = statement.executeUpdate(sql);
			if (i > 0) {
				System.out.println("ɾ����Ʒ�ɹ���" + i);
			} else {
				System.out.println("ɾ����Ʒʧ�ܣ�" + i);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}

	}

	// ����������Ʒ
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

			System.out.println("===========================����ӵ���Ʒ���£�===========================");
			System.out.println("��Ʒ���\t��Ʒ����\t��Ʒ�۸�\t��Ʒ����");	
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
				System.out.println("��û����κ���Ʒ�������ȥ����");
				System.out.println();
				i = false;
			}else{
			    System.out.println("����֮����Ҫ����Ǯ�ǣ�" + pSum);
			    i = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
		return i;
	}

	// �ж�buy����û����Ӧ����Ʒ
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

	// ����СƱ
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

			System.out.println("===========================�㹺�����Ʒ���£�===========================");
			System.out.println("----------------------------------------------------------------------");

			System.out.println("��Ʒ���\t��Ʒ����\t��Ʒ�۸�\t��Ʒ����");

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
				

            //����
			kuDelete(number,fullNumber);
			
			}
			
			System.out.println("�㸶��Ǯ�ǣ�" + pSum + ",����СƱ�����պ�");
			
			biaoDelete();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCUntils.Close(resultSet, statement, connection);
		}
	}
	
	//����
	public void kuDelete(String number,Float fullNumber){
		Connection connection=null;
		Statement statement = null;
		
		try {
			connection = JDBCUntils.getConnection();
			
			//3.����statement ����
			statement = connection.createStatement();
			
			goodsImpl g = new goodsImpl();
			float n = g.find4(number) - fullNumber;
					
			//4.ָ��sql
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

	//���buy��
	public void biaoDelete(){
		Connection connection=null;
		Statement statement = null;
		
		try {
			connection = JDBCUntils.getConnection();
			
			//3.����statement ����
			statement = connection.createStatement();
					
			//4.ָ��sql
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
