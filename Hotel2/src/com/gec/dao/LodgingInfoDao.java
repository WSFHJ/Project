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
	
	
	//	| id            | int(32)     | (������) [��ȥȷ��]
	//	| entryDate     | timestamp   | ��ס����  [������]
	//	| leaveDate     | timestamp   | �������  [������]
	//	| days          | int(11)     | ����      [д����]
	//	| roomId        | varchar(32) | ����ID    [������]
	//	| deposit       | int(11)     | Ѻ��      [������]
	
	//	| reservationId | varchar(32) | ��ס�Ǽ���ID  [û������]  ���� ...
	
	//	| operatorId    | int(32)     | ������Ա(������ID) [������]
	//	| createDate    | timestamp   | ��������   [sqlʵ��]
	//{ps} �ڵ�����һ������ǰ����õ� ��ס�Ǽ��˵� ID
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
			lodInfo.setDays(days);    //{ps} ������ס����
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
			
			//{ps} ��ȡ insert into ����, �������� ID
			sql = "SELECT LAST_INSERT_ID()";
			pmst = conn.prepareStatement( sql );
			ResultSet rs = pmst.executeQuery();
			int newId = 0;
			if( rs.next() ){
				newId = rs.getInt( 1 );
				lodInfo.setId(newId);
			}
			iTrace.print( "������: "+ updateCnt );
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

	//{ps} �ڵ�����һ������ǰ����õ� ��ס�� ID
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
				//{7} ������
 				pmst.setInt( 1, lodInfoId );
 				pmst.setString( 2, lodger.getCertificate() );
 				pmst.setString( 3, lodger.getCertificateNo() );
 				pmst.setString( 4, lodger.getLodgerName() );
 				pmst.setString( 5, lodger.getSex() );
 				pmst.setString( 6, lodger.getIsRegister() );
 				pmst.setString( 7, lodger.getPhone() );
 				pmst.addBatch();   //���뵽һ��������ָ��Ļ����� ...
			}
			int[] cnts = pmst.executeBatch();   //һ����ִ�����еĲ������ ..
			//----- Ҫȥ�������� ----
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.closeConnection( conn );
		}
		return updateCnt;
	}

	private int getDays(Date d1, Date d2){
		//{ps} �õ� d1, d2 ������
		long s1 = d1.getTime()/1000; //{ps} ת����  --> ��
		long s2 = d2.getTime()/1000; //{ps} ת����  --> ��
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
	
				if( rs.next() ){  //{ps} ��������ݵĻ� ...
					
					int id = rs.getInt("id"); //�������
					String lodgerName = rs.getString("lodgerName"); //����
					String roomId = rs.getString("roomId");         //��ס����
					String entryDate = rs.getString("entryDate");   //��ס����
					String leaveDate = rs.getString("leaveDate");   //�������
					int days = rs.getInt("days");                   //��ס����
					int deposit = rs.getInt("deposit");             //Ѻ��
					
					String l = "[id:"+id+",lodgerName:"+lodgerName+",roomId:"+roomId+",entryDate:"+entryDate+
							   ",leaveDate:"+leaveDate+",days:"+days+",deposit:"+deposit+"]";
					
//		            list.add(l);
				}
				
				/*
				 * <tr>
						<th>�������</th>
						<th>����</th>
						<th>��ס����</th>	
						<th>��סʱ��</th>
						<th>����ʱ��</th>
						<th>��ס����</th>
						<th>Ѻ��</th>
						<th>����</th>
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
