package com.gec.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gec.dao.utils.Data;
import com.gec.dao.utils.EntityTool;
import com.gec.dao.utils.SqlData;
import com.gec.utils.BeanUtils;
import com.gec.utils.JdbcUtils;
import com.gec.utils.iTrace;

// <T>  ---> ���ⲿ����� �������  
public class BaseDao<T> {
	//��һ����Ա�������� ����Ϊ T �� class ����
	Class<T> clazz = null;
	public BaseDao(){ clazz = getTClass(); }
	//������һ�����ͷ���, �����ﷵ����һ�� T �������͵�ʵ��
	//���� sql, ͨ����� sql ���ȥ���ݿ��ѯ
	//args: sql ��ѯ�Ĳ���
	@SuppressWarnings({ "unchecked", "hiding" })
	public <T> T get(Connection conn, String sql, Object... args ) 
			throws SQLException {
		iTrace.print( " clazz: "+ clazz );
		T instance = null;
		PreparedStatement pstmt = null;
		try {
			if( conn != null ){
				pstmt = conn.prepareStatement( sql );
				setParameters( pstmt, 0, args );
				ResultSet rs =pstmt.executeQuery();                  // ִ�в�ѯ				
				instance = (T) fillProperties( rs );
			}
		}catch( IllegalAccessException e ){
			throw new SQLException( e.getMessage() );
		}finally{
			pstmt.close();
			//conn.close();
		}
		return instance;
	}
	

	private T fillProperties( ResultSet rs )
			throws SQLException, IllegalAccessException {
		//{ps} ͨ��  RS ����  getMetaData ��ȡһ����ṹ��Ϣ����
		ResultSetMetaData md = rs.getMetaData();
		T bean = null;
		if( rs.next() ){
			try {
				bean = clazz.newInstance();
				for( int index=1; index<md.getColumnCount(); index++ ){
					BeanUtils.setProperty( bean, md.getColumnLabel(index), 
							rs.getString(index) );
				}
			} catch ( InstantiationException | IllegalAccessException e ) {
				throw new IllegalAccessException();
			}
		}
		rs.close();
		return bean;
	}
	
	public int addNew( SqlData sql, T entity ) 
			throws SQLException {
		String table = entity.getClass().getName();
		table = table.replaceAll( 
				"\\w+(\\.(\\w+))+\\.(\\w+)", "$3" );
		String sqlStr = String.format( "insert into %s(%s) values(%s)",
				table, sql.fields, sql.values );
		iTrace.print( sqlStr );
		Connection conn = JdbcUtils.getConnection();
		int count = 0;
		if( conn != null ){
			PreparedStatement psmt = conn.prepareStatement( sqlStr );
			setParameters( psmt, sql, entity );
			count = psmt.executeUpdate();
			psmt.close();
		}
		//conn.close();
		return count;
	}
	
	private void setParameters( PreparedStatement psmt, 
			SqlData sql, T entity ) throws SQLException {
		if( sql.createId ){
			EntityTool.setUUIDForBean( entity );
		}
		for( int i=1; i <= sql.length; i++ ){
			if( sql.getValue(i).equals( "?" ) ){
				String fldName = sql.getField(i);
				iTrace.print("�ֶ���: "+ fldName);
				Data data = null;
				try {
					data = Data.getProperty( fldName, entity );
					if( data.type==String.class ){
						psmt.setString( i , (String)data.value );
					}else if( data.type==Integer.class ){
						psmt.setInt( i , (Integer)data.value );
					}else if( data.type==Double.class ){
						psmt.setDouble( i , (Double)data.value );
					}
				} catch (IllegalAccessException e) {
					iTrace.print( e );
				}
			}
		}
	}

	//д��һ��ʵ�����ݵ����ݿ�
	public int save( Connection conn, String sql, Object...args ) throws SQLException{
		//[1] ͨ�� C3P0 ��ȡ����Դ�� Connection ����
		int count = 0;
		if( null != conn ){
			PreparedStatement psmt = conn.prepareStatement(sql);
			setParameters( psmt, 0, args );
			iTrace.print();	    //{ps} ��ӡ������Ϣ	
			count = psmt.executeUpdate();     //���� Ԥ����� Stmt ������Ҳ������ݵ����ݿ�
			psmt.close();
		}
		//conn.close();
		return count;
	}
	
	public List<T> getList( Connection conn, String sql, Object...args ) 
			throws SQLException {
		iTrace.print( "length: "+ args.length );
		List<T> list = null;
		list = new ArrayList<T>();
		PreparedStatement psmt = conn.prepareStatement( sql );
		setParameters( psmt, 0, args );
		ResultSet rs = psmt.executeQuery();
		ResultSetMetaData md = rs.getMetaData();   // [ ��Ľṹ  ]
		try{
			while( rs.next() ){
				T instance = null;
				instance = createBean( clazz, rs, md );
				list.add( instance );
			}
		} catch( IllegalAccessException e) {
			throw new SQLException( e.getMessage() );
		} finally {
			rs.close();
			psmt.close();
			//conn.close();
		}
		return list;
	}

	private <K> K createBean( Class<K> clazz, ResultSet rs, ResultSetMetaData md ) 
			throws IllegalAccessException, SQLException {
		K instance = null;
		try {
			instance = clazz.newInstance();
		} catch (InstantiationException e) {
			iTrace.print(e);
			throw new IllegalAccessException();
		}
		for( int i=1; i<=md.getColumnCount(); i++ ){
			BeanUtils.setProperty( instance, 
					md.getColumnLabel( i ), rs.getString( i ) );
		}
		return instance;
	}
	
	public <E> List<E> getGivenTypeList(Connection conn, String sql, Class<E> EClazz, Object...args )
			throws SQLException {
		List<E> list = null;
		if( conn!=null ){
			PreparedStatement psmt = conn.prepareStatement(sql);   // Ԥ���� sql ָ��
			setParameters( psmt, 0, args );
			ResultSet rs = psmt.executeQuery();          //{ps} ȥ���ݿ��ѯ
			list = new ArrayList<E>();    //{ps} ����һ�� ArrayList<E> , װ�� E �������͵�����
			ResultSetMetaData md = rs.getMetaData();   //ȡ����Ľṹ��Ϣ, ����˵: �������, ��������ֶ���
			while( rs.next() ){   //����ÿһ����¼
				E eBean = null;
				try {
					eBean = createBean( EClazz, rs, md );
					list.add( eBean );     //��ʵ��������뼯��
				} catch (IllegalAccessException e) {
					iTrace.print( e );
				}
			}
		}
		return list;
	}
	
	public List<Object[]> getObjectList( String sql, Object...args ) 
			throws SQLException, IllegalAccessException {
		Connection conn = JdbcUtils.getConnection();
		List<Object[]> list = null;
		if( conn!=null ){
			list = new ArrayList<Object[]>();
			PreparedStatement psmt = conn.prepareStatement( sql );
			setParameters( psmt, 0, args );
			ResultSet rs = psmt.executeQuery();
			ResultSetMetaData md = rs.getMetaData();   //ȡ����Ľṹ��Ϣ
			while( rs.next() ){
				Object[] objs = new Object[ md.getColumnCount() ];
				for( int i=1; i<=md.getColumnCount(); i++ ){
					objs[ i-1 ] = rs.getObject( i );
				}
				list.add( objs );
			}
			rs.close();
			psmt.close();
		}
		//conn.close();
		return list;
	}
	
	public int getRecCount( String sql, Object...args ) 
			throws SQLException {
		Connection conn = JdbcUtils.getConnection();
		int count = 0;
		if( null != conn ){
			PreparedStatement psmt = conn.prepareStatement( sql );
			setParameters( psmt, 0, args );
			ResultSet rs = null;
			try {
				rs = psmt.executeQuery();
				iTrace.print();
				if( rs.next() ){
					count = rs.getInt( 1 );
					iTrace.print();
				}
				iTrace.print();
			} catch( SQLException e ) {
				throw new SQLException();
			}
			rs.close();
			psmt.close();
		}
		//conn.close();
		return count;
	}
	
	private void setParameters( PreparedStatement pstmt, int offset, Object...args )
			throws SQLException{
		for( int i = 0; i<args.length; i++ ){
			if( args[i] != null ){
				Class<?> cls = args[i].getClass();   //��ȡ���� Class
				int index = i + 1 + offset;
				if( cls==String.class ){
					//iTrace.print( (String)args[i] );
					pstmt.setString( index, (String)args[i] );   //ע��: ����ֵ �� 1 ��ʼ
				}else if( cls==Integer.class ){
					//iTrace.print( ((Integer)args[i]).toString() );
					pstmt.setInt( index, (Integer)args[i] );
				}else if( cls==Double.class ){
					//iTrace.print( ((Integer)args[i]).toString() );
					pstmt.setDouble( index, (Double)args[i] );
				}
			}				
		}
	}
	
	@SuppressWarnings("unchecked")
	public Class<T> getTClass(){
		//getClass(): class com.gec.dao.UserDaoImpl
		iTrace.print( ""+ getClass() );
		//genericSuperclass: com.gec.dao.BaseDao<com.gec.entity.User>
		Type genericSuperclass = getClass().getGenericSuperclass();
		//Ŀ����Ҫ��ȡ: com.gec.entity.User
		Type[] arguments = ((ParameterizedType)genericSuperclass)
							.getActualTypeArguments();
		return (Class<T>)arguments[0];
	}

}
