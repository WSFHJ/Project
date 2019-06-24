package com.gec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gec.model.Page;
import com.gec.model.Roomtype;
import com.gec.utils.JdbcUtils;
import com.gec.utils.iTrace;

public class TypeDao extends BaseDao<Roomtype> {

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
	
	public Page<Roomtype> getTypeList(Page page) {
		String sqlFields = " typeName , dayPrice , hourPrice ";
		String sqlQuery = " from roomtype ";
		String sql = "select "+ sqlFields +sqlQuery +" limit ?,?";
		Connection conn = JdbcUtils.getConnection();
		int recCnt = getTotalRec( conn, "select count(*) "+ sqlQuery);
		iTrace.print( "总记录数: "+ recCnt );
		int offset = (page.getCurPage()-1)*Page.recOfPage;
		Page<Roomtype> dbPage = new Page<Roomtype>();
		dbPage.setParameters( recCnt, page.getCurPage() );
		List<Roomtype> list = new ArrayList();
		try {
			list = getList(conn, sql, offset, Page.recOfPage);
			dbPage.setList( list );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbPage;
	}
	
//	public void setStatus(String roomId, String status) {
//		String sql = "update room set status=? where id=?";
//		Connection conn = JdbcUtils.getConnection();
//		try {
//			int cnt = save(conn, sql, status, roomId);
//			iTrace.print("cnt = "+ cnt);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally{
//			JdbcUtils.closeConnection(conn);
//		}
//	}
	
	public int saveRoom(Roomtype roomtype) {
		Connection conn = JdbcUtils.getConnection();
		iTrace.print();
		String fidlds = "typeName,dayPrice,hourPrice,updateDate,createDate";
        String sql = "insert into roomtype("+ fidlds +") "
        		+ "values("
        		+ "'"+roomtype.getTypeName()+"',"
        		+ "'"+roomtype.getDayPrice()+"',"
        		+ "'"+roomtype.getHourPrice()+"',NOW(),NOW())";
        int i = 0;
        try {
			 i = conn.prepareStatement(sql).executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		iTrace.print();
		
		return i;
	}
}
