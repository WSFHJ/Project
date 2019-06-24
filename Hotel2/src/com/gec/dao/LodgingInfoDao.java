package com.gec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.gec.model.Lodger;
import com.gec.model.LodgingInfo;
import com.gec.utils.JdbcUtils;
import com.gec.utils.iTrace;

public class LodgingInfoDao extends BaseDao<LodgingInfo> {
	
	
	//	| id            | int(32)     | (自增长) [你去确认]
	//	| entryDate     | timestamp   | 入住日期  [有数据]
	//	| leaveDate     | timestamp   | 离店日期  [有数据]
	//	| days          | int(11)     | 天数      [写代码]
	//	| roomId        | varchar(32) | 房间ID    [有数据]
	//	| deposit       | int(11)     | 押金      [有数据]
	
	//	| reservationId | varchar(32) | 入住登记者ID  [没有数据]  待定 ...
	
	//	| operatorId    | int(32)     | 工作人员(操作者ID) [有数据]
	//	| createDate    | timestamp   | 创建日期   [sql实现]
	//{ps} 在调用这一个方法前必须得到 入住登记人的 ID
	public LodgingInfo saveLodgingInfo(LodgingInfo lodInfo) {
		iTrace.print();
		String fields = "entryDate,leaveDate,days,roomId,deposit,"+
						"operatorId,createDate";
		String sql = "insert into lodginginfo("+ fields +") values(?,?,?,?,?,?,NOW())";
		Connection conn = JdbcUtils.getConnection();
		
		String entryDate = lodInfo.getEntryDate();
		String leaveDate = lodInfo.getLeaveDate();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		iTrace.print();
		Date d1;
		Date d2;
		int days = 0;
		try {
			d1 = sdf.parse( entryDate );
			d2 = sdf.parse( leaveDate );
			days = getDays(d1, d2);
			lodInfo.setDays(days);    //{ps} 设置入住天数
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		int updateCnt = 0;
		iTrace.print();
		PreparedStatement pmst = null;
		try {
			iTrace.print();
			updateCnt = save( conn, sql, entryDate, leaveDate, days, lodInfo.getRoomId(), 
					lodInfo.getDeposit(), lodInfo.getOperatorId() );
			
			//{ps} 获取 insert into 过后, 产生的新 ID
			sql = "SELECT LAST_INSERT_ID()";
			pmst = conn.prepareStatement( sql );
			ResultSet rs = pmst.executeQuery();
			int newId = 0;
			if( rs.next() ){
				newId = rs.getInt( 1 );
				lodInfo.setId(newId);
			}
			iTrace.print( "更新数: "+ updateCnt );
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.closeConnection(conn);
		}
		return lodInfo;
	}
	
//	| id            | int(32)
//	| lodgingInfoId | int(32) 
//	| certificate   | varchar(1)  
//	| certificateNo | varchar(32) 
//	| lodgerName    | varchar(32) 
//	| sex           | varchar(1)  
//	| isRegister    | varchar(1)  
//	| phone         | varchar(32) 
//	| note          | varchar(255)
//	| createDate    | timestamp

	//{ps} 在调用这一个方法前必须得到 入住单 ID
	public int saveLodgers(List<Lodger> list, int lodInfoId) {
		//{ps} 
		Connection conn = JdbcUtils.getConnection();
		String fidlds = "lodgingInfoId,certificate, certificateNo, lodgerName,sex,isRegister,"+
						"phone,createDate";
		String sql = "insert into lodger("+ fidlds +") values(?,?,?,?,?,?,?,NOW())";
		PreparedStatement pmst = null;
		int updateCnt = 0;
		try {
			pmst = conn.prepareStatement(sql);
			for (Lodger lodger : list) {
				//{7} 个参数
 				pmst.setInt( 1, lodInfoId );
 				pmst.setString( 2, lodger.getCertificate() );
 				pmst.setString( 3, lodger.getCertificateNo() );
 				pmst.setString( 4, lodger.getLodgerName() );
 				pmst.setString( 5, lodger.getSex() );
 				pmst.setString( 6, lodger.getIsRegister() );
 				pmst.setString( 7, lodger.getPhone() );
 				pmst.addBatch();   //加入到一个批处理指令的缓存中 ...
			}
			int[] cnts = pmst.executeBatch();   //一次性执行所有的插入语句 ..
			//----- 要去迭代数组 ----
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.closeConnection( conn );
		}
		return updateCnt;
	}

	private int getDays(Date d1, Date d2){
		//{ps} 拿到 d1, d2 的秒数
		long s1 = d1.getTime()/1000; //{ps} 转毫秒  --> 秒
		long s2 = d2.getTime()/1000; //{ps} 转毫秒  --> 秒
		int days = (int)(s2-s1)/(3600*24);
		return days+1;
	}

	//SELECT * FROM lodger lr LEFT JOIN lodginginfo lo ON lr.`lodgingInfoId`= lo.id ;
	@Test
	public List<LodgingInfo> getItem() {
		String sqlFields = " * ";
		String sqlQuery = " from lodger lr LEFT JOIN lodginginfo lo ON lr.`lodgingInfoId`= lo.id ";
		String sql = "select "+ sqlFields + sqlQuery ;
		Connection conn = JdbcUtils.getConnection();
		
		PreparedStatement psmt = null; 
		List<LodgingInfo> list = new ArrayList<LodgingInfo>();

			try {
//				list = getList(conn, sql);
		
				psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery();
	
				if( rs.next() ){  //{ps} 如果有数据的话 ...
					
					int id = rs.getInt("id"); //订单编号
					String lodgerName = rs.getString("lodgerName"); //宾客
					String roomId = rs.getString("roomId");         //入住房间
					String entryDate = rs.getString("entryDate");   //入住日期
					String leaveDate = rs.getString("leaveDate");   //离店日期
					int days = rs.getInt("days");                   //入住天数
					int deposit = rs.getInt("deposit");             //押金
					
					String l = "[id:"+id+",lodgerName:"+lodgerName+",roomId:"+roomId+",entryDate:"+entryDate+
							   ",leaveDate:"+leaveDate+",days:"+days+",deposit:"+deposit+"]";
					
//		            list.add(l);
				}
				
				/*
				 * <tr>
						<th>订单编号</th>
						<th>宾客</th>
						<th>入住房间</th>	
						<th>入住时间</th>
						<th>结束时间</th>
						<th>入住天数</th>
						<th>押金</th>
						<th>操作</th>
					</tr>
				 * */
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
//			
		iTrace.print(list);
		return list;  
	}
	
}
