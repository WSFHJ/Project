package com.gec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.gec.model.Page;
import com.gec.model.Room;
import com.gec.utils.JdbcUtils;
import com.gec.utils.iTrace;

public class RoomDao extends BaseDao<Room> {
	
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

	public Page<Room> getRoomList( Page page ){
		String sqlFields = "r.id, r.floor, rt.typeName,r.status";
		String sqlQuery = " from room r left join roomtype rt "+
			" on r.typeId=rt.id "+
			" order by r.id ";
		String sql = "select "+ sqlFields + sqlQuery +" limit ?, ?";
		Connection conn = JdbcUtils.getConnection();
		//{ps} 获取总记录数: recCnt
		int recCnt = getTotalRec( conn, "select count(*) "+ sqlQuery);
		iTrace.print( "总记录数: "+ recCnt );
		//{ps} 如果, 要考虑分页, 首页要把第  1  个问号落实下来..
		//     计算偏移量 Offset:
		//     recOfPage: 就是每页的记录数 ..
		int offset = (page.getCurPage()-1)*Page.recOfPage;
		//{ps} 创建 Page
		Page<Room> dbPage = new Page<Room>();
		//{ps} dbPage.setParameters( 总记录数, 当前页数 );
		dbPage.setParameters( recCnt, page.getCurPage() );
		List<Room> list = new ArrayList();
		try {
			list = getList(conn, sql, offset, Page.recOfPage);
			//{ps} 将查询出来的  List 集合, 设置到 Page 里面 ..
			dbPage.setList( list );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbPage;   //{ps} 返回 Page 对象...
	}
	
	private void prtList(List<Room> list) {
		for (Room room : list) {
			iTrace.print( room );
		}
	}

	@Test
	public void test1(){
		Page page = new Page();
		page.setCurPage(3);    //当前页: 2
		
		getRoomList( page );
	}

	public int setStatus(String roomId, String status) {
		String sql = "update room set status=? where id=?";
		Connection conn = JdbcUtils.getConnection();
		int cnt = 0;
		try {
			cnt = save(conn, sql, status, roomId);
			iTrace.print("cnt = "+ cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.closeConnection(conn);
		}
		return cnt;
	}

	public int saveRoom(Room room) {
		Connection conn = JdbcUtils.getConnection();
		iTrace.print();
		String fidlds = "id,typeId,floor,updateDate,createDate";
        String sql = "insert into room("+ fidlds +") "
        		+ "values("
        		+ "'"+room.getId()+"',"
        		+ "'"+room.getTypeId()+"',"
        		+ "'"+room.getFloor()+"',NOW(),NOW())";
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

	public Page<Room> getStateList(Page page) {
//		String sqlFields = " * ";
//		String sqlQuery = " from room ";
//		String sql = "select "+ sqlFields + sqlQuery +" where floor = ?";
//		Connection conn = JdbcUtils.getConnection();
//		
//		//{ps} 获取总记录数: recCnt
//		int recCnt = getTotalRec( conn, "select count(*) "+ sqlQuery);
//		iTrace.print( "总记录数: "+ recCnt );
//		
//		String s = "select count(*) from room where floor = "+page.getCurPage()+";";
//		int i = 0;
//		try {
//			i = conn.prepareStatement(s).executeUpdate();
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		page.setCurPage(i);
//		
//		//{ps} 如果, 要考虑分页, 首页要把第  1  个问号落实下来..
//		//     计算偏移量 Offset:
//		//     recOfPage: 就是每页的记录数 ..
//		int offset = (page.getCurPage()-1)*page.getCurPage();
//		
//		
//		//{ps} 创建 Page
//		Page<Room> dbPage = new Page<Room>();
//		//{ps} dbPage.setParameters( 总记录数, 当前页数 );
//		dbPage.setParameters( recCnt, page.getCurPage() );
//		List<Room> list = new ArrayList();
//		try {
//			list = getList(conn, sql, offset, page.getCurPage());
//			//{ps} 将查询出来的  List 集合, 设置到 Page 里面 ..
//			dbPage.setList( list );
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return dbPage;   //{ps} 返回 Page 对象...
		
		String sqlFields = "r.id, r.floor, rt.typeName,r.status";
		String sqlQuery = " from room r left join roomtype rt "+
			" on r.typeId=rt.id "+
			" order by r.id ";
		String sql = "select "+ sqlFields + sqlQuery +" limit ?, ?";
		Connection conn = JdbcUtils.getConnection();
		//{ps} 获取总记录数: recCnt
		int recCnt = getTotalRec( conn, "select count(*) "+ sqlQuery);
		iTrace.print( "总记录数: "+ recCnt );
		//{ps} 如果, 要考虑分页, 首页要把第  1  个问号落实下来..
		//     计算偏移量 Offset:
		//     recOfPage: 就是每页的记录数 ..
		int offset = (page.getCurPage()-1)*Page.recOfPage;
		//{ps} 创建 Page
		Page<Room> dbPage = new Page<Room>();
		//{ps} dbPage.setParameters( 总记录数, 当前页数 );
		dbPage.setParameters( recCnt, page.getCurPage() );
		List<Room> list = new ArrayList();
		try {
			list = getList(conn, sql, offset, Page.recOfPage);
			//{ps} 将查询出来的  List 集合, 设置到 Page 里面 ..
			dbPage.setList( list );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbPage;   //{ps} 返回 Page 对象...
		
	}
}
