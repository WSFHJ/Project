package com.gec.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtils {

	private final static String USERNAME = "root";
	private final static String PASSWORD = "root";        //没有密码就写: null
	private final static String DATABASE = "base";   //数据库名称
	
	//jdbc:mysql://mysql服务器IP:端口/数据库名称   ?  useUnicode=true  &  characterEnocoding=utf-8
	//{1} useUnicode: 使用 unicode 的编码来进行数据交互。
	//{2} characterEnocoding: 具体用哪一种编码格式。
	private final static String URL = "jdbc:mysql://localhost:3306/"+ DATABASE +
						 			  "?useUnicode=true&characterEncoding=utf-8";
	static {
		//{1} 使用反射来加载 mysql 的驱动
		//    (a) 先找到驱动所在的位置。
		try {
			Class.forName("com.mysql.jdbc.Driver");
			iTrace.print("(JDBC) 驱动加载成功 ...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//{ps} 获取数据库的连接, 切记导包不要导错: java.sql 这一个包
	public static Connection getConnection(){
		Connection conn = null;
		//{1} 使用驱动管理器来获取数据库的连接 ..
		try {
			//{2} 有可能会获取连接失败, 
			//常见原因(1): URL, Username, password 填写不正确
			//常见原因(2): mysql 连接不上, mysql 服务有问题 ...
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			iTrace.print("(JDBC) 获取连接成功..");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//{ps} 关闭数据的连接
	public static void closeConnection(Connection conn){
		if(conn!=null){
			try {
				conn.close();
				iTrace.print("(JDBC) 连接已关闭 ..");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
