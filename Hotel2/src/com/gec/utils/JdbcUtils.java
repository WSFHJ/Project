package com.gec.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtils {

	private final static String USERNAME = "root";
	private final static String PASSWORD = "root";        //û�������д: null
	private final static String DATABASE = "base";   //���ݿ�����
	
	//jdbc:mysql://mysql������IP:�˿�/���ݿ�����   ?  useUnicode=true  &  characterEnocoding=utf-8
	//{1} useUnicode: ʹ�� unicode �ı������������ݽ�����
	//{2} characterEnocoding: ��������һ�ֱ����ʽ��
	private final static String URL = "jdbc:mysql://localhost:3306/"+ DATABASE +
						 			  "?useUnicode=true&characterEncoding=utf-8";
	static {
		//{1} ʹ�÷��������� mysql ������
		//    (a) ���ҵ��������ڵ�λ�á�
		try {
			Class.forName("com.mysql.jdbc.Driver");
			iTrace.print("(JDBC) �������سɹ� ...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//{ps} ��ȡ���ݿ������, �мǵ�����Ҫ����: java.sql ��һ����
	public static Connection getConnection(){
		Connection conn = null;
		//{1} ʹ����������������ȡ���ݿ������ ..
		try {
			//{2} �п��ܻ��ȡ����ʧ��, 
			//����ԭ��(1): URL, Username, password ��д����ȷ
			//����ԭ��(2): mysql ���Ӳ���, mysql ���������� ...
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			iTrace.print("(JDBC) ��ȡ���ӳɹ�..");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//{ps} �ر����ݵ�����
	public static void closeConnection(Connection conn){
		if(conn!=null){
			try {
				conn.close();
				iTrace.print("(JDBC) �����ѹر� ..");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
