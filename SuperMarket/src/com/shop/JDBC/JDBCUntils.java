package com.shop.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * jdbc �������װ
 * 
 * @author
 * 
 * @version 1.0
 *
 */

public class JDBCUntils {
	static String DriverClassSName = "com.mysql.jdbc.Driver";

	static String url = "jdbc:mysql://localhost:3306/shopping";

	static String user = "root";

	static String password = "root";

	// static {
	// try {
	// Class.forName(JDBCUntils.DriverClassSName);
	// } catch (ClassNotFoundException e) {
	//
	// e.printStackTrace();
	// }
	// }

	/**
	 * ��ȡConnection����
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = null;
		try {
			Class.forName(JDBCUntils.DriverClassSName);
			con = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;

	}

	public static void Close(ResultSet rs, Statement st, Connection con) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
