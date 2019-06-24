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

// <T>  ---> 从外部传入的 类的类型  
public class BaseDao<T> {
	//用一个成员变量保存 类型为 T 的 class 对象
	Class<T> clazz = null;
	public BaseDao(){ clazz = getTClass(); }
	//定义了一个泛型方法, 在这里返回了一个 T 这种类型的实例
	//定义 sql, 通过这个 sql 语句去数据库查询
	//args: sql 查询的参数
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
				ResultSet rs =pstmt.executeQuery();                  // 执行查询				
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
		//{ps} 通过  RS 对象  getMetaData 获取一个表结构信息对象
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
				iTrace.print("字段名: "+ fldName);
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

	//写入一个实体数据到数据库
	public int save( Connection conn, String sql, Object...args ) throws SQLException{
		//[1] 通过 C3P0 获取数据源的 Connection 对象
		int count = 0;
		if( null != conn ){
			PreparedStatement psmt = conn.prepareStatement(sql);
			setParameters( psmt, 0, args );
			iTrace.print();	    //{ps} 打印跟踪信息	
			count = psmt.executeUpdate();     //利用 预编译的 Stmt 对象帮我插入数据到数据库
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
		ResultSetMetaData md = rs.getMetaData();   // [ 表的结构  ]
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
			PreparedStatement psmt = conn.prepareStatement(sql);   // 预编译 sql 指令
			setParameters( psmt, 0, args );
			ResultSet rs = psmt.executeQuery();          //{ps} 去数据库查询
			list = new ArrayList<E>();    //{ps} 创建一个 ArrayList<E> , 装载 E 这种类型的数据
			ResultSetMetaData md = rs.getMetaData();   //取出表的结构信息, 比如说: 表的列数, 表的所有字段名
			while( rs.next() ){   //遍历每一条记录
				E eBean = null;
				try {
					eBean = createBean( EClazz, rs, md );
					list.add( eBean );     //把实例对象放入集合
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
			ResultSetMetaData md = rs.getMetaData();   //取出表的结构信息
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
				Class<?> cls = args[i].getClass();   //获取它的 Class
				int index = i + 1 + offset;
				if( cls==String.class ){
					//iTrace.print( (String)args[i] );
					pstmt.setString( index, (String)args[i] );   //注意: 索引值 从 1 开始
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
		//目标我要获取: com.gec.entity.User
		Type[] arguments = ((ParameterizedType)genericSuperclass)
							.getActualTypeArguments();
		return (Class<T>)arguments[0];
	}

}
