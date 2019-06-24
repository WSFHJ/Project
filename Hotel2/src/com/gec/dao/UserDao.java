package com.gec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gec.model.Page;
import com.gec.model.User;
import com.gec.utils.JdbcUtils;
import com.gec.utils.iTrace;

public class UserDao extends BaseDao<User> {
	/*
	 *  方法描述: 
	 *  功能简介:
	 *     用户登录验证(负责取数据)
	 */
	public User validateUser(String account, String pass){
		String sql = "select * from user u where u.account=? and u.pass=?";
		Connection conn = JdbcUtils.getConnection();
		User dbUser = null;
		try {
			return get(conn, sql, account, pass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
//	@Test
//	public void test1(){
//		User user = validateUser("andy", "123");
//		iTrace.print( user );
//	}
	
	
	public int getTotalRec(Connection conn, String sql){
		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement( sql );
			ResultSet rs = psmt.executeQuery();
			if( rs.next() ){
				return rs.getInt( 1 );   //记录数 ...
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	//select u.id,account,name,roleName,createDate 
	//from user u left join role r on r.id = u.roleId;
	public Page<User> getUserList(Page page) {
		String sqlFields = "u.account , u.name , r.roleName , u.createDate ,u.id";
		String sqlQuery = " from user u left join role r on r.id = u.roleId ";
		String sql = "select "+ sqlFields + sqlQuery +" limit ?, ?";
		Connection conn = JdbcUtils.getConnection();
		
		int recCnt = getTotalRec(conn, "select count(*) "+sqlQuery);
		iTrace.print( "总记录数: "+ recCnt );
		int offset = (page.getCurPage()-1)*Page.recOfPage;
		Page<User> dbPage = new Page<User>();
		dbPage.setParameters( recCnt, page.getCurPage() );
		List<User> list = new ArrayList();
		try {
			list = getList(conn, sql, offset, Page.recOfPage);
			dbPage.setList( list );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbPage;  
	}
	
	public int saveUsers(User user){
		Connection conn = JdbcUtils.getConnection();
		iTrace.print();
		
		String fidlds = "account,NAME,pass,roleId,createDate";
        String sql = "insert into user("+ fidlds +") "
        		+ "values("
        		+ "'"+user.getAccount()+"',"
        		+ "'"+user.getName()+"',"
        		+ "'"+user.getPass()+"',"
        		+ "'"+user.getRoleId()+"',NOW())";
        int i = 0;
        try {
			 i = conn.prepareStatement(sql).executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		iTrace.print();
		
		return i;
	}


	public int delUsers(User user) {
		Connection conn = JdbcUtils.getConnection();
		
        String sql = "delete from user where id="+user.getId()+";";
        int i = 0;
        try {
			i = conn.prepareStatement(sql).executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return i;
	}
}


