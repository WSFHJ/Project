package com.taobao.UserDao.Impl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.util.ArrayList;

import com.taobao.UserDao.UserDao;
import com.taobao.entity.User;

import JDBC.JDBCUntils;

public class UserDaoImpl implements UserDao {
	
	
	//ʹ�þ�̬ static
// private static ArrayList<User> list = new ArrayList<User>();
	
	
	//���û�������û��������뱣�浽�����оͿ�����
	public void regesiter(User u) {
//	  list.add(u);
		
		Connection connection = null;
		Statement statement = null;
		
		try {
			 connection = JDBCUntils.getConnection();
			 statement = connection.createStatement();
			 
			 String sql = "insert into login value('"+u.getUsernames()+"','"+u.getUserpassword()+"')";
			 int i = statement.executeUpdate(sql);
			 if (i>0) {
				System.out.println("������ݳɹ� "+i);
			}else {
				System.out.println("�������ʧ�� "+i);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			JDBCUntils.Close(null, statement, connection);
		}
	}

	
    // ����˺ź�����ͬʱ��ȷ����ô��¼�ɹ�������true�����򷵻�false
	public boolean login(String username, String userpassword) {
//		boolean flag  = false;
//		for(User u:list)
//		{
//		  if(u.getUsernames().equals(username)&&u.getUserpassword().equals(userpassword))	
//		  {
//			flag = true;  
//		  }
//		  else
//		  {
//			  flag = false;
//		  }
//		}
//		return flag;
		
		boolean i = false;
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			 connection = JDBCUntils.getConnection();
			 statement = connection.createStatement();
			 
			 String sql = "select * from login";
			 resultSet = statement.executeQuery(sql);
			 while(resultSet.next()){
				 if (resultSet.getString("username").equals(username)&&resultSet.getString("password").equals(userpassword)) {
					i= true;
					break;
					
				}else {
					i= false;
				}
			 }
			 
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			JDBCUntils.Close(resultSet , statement, connection);
		}	
			return i;
		
	}
	
	
	public static void login(String username, String userpassword,String userroot) {	
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			 connection = JDBCUntils.getConnection();
			 statement = connection.createStatement();
			 
			 String sql = "select * from login";
			 resultSet = statement.executeQuery(sql);
			 while(resultSet.next()){
				 if (resultSet.getString("username").equals(username)&&resultSet.getString("password").equals(userpassword)) {
					
				}else {
					
				}
			 }
			 
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			JDBCUntils.Close(resultSet , statement, connection);
		}	
		
	}

}
