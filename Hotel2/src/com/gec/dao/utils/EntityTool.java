package com.gec.dao.utils;

import java.lang.reflect.Field;
import com.gec.utils.iTrace;

public class EntityTool {
	
	//获取一个 32 位的 UUID 编码
	public static String createUUID(){
		byte[] buff = new byte[32];   // 32 个字节  byte 数组, 字母 + 数学 随机组合
		for(int i=0; i<32; i++){
			int r = (int)(Math.random()*2);  //生成 0- 1 随机数
			if( r==0){
				buff[i] = (byte)((Math.random()*26)+97);  //从 a 生成 a-z
			}else{
				buff[i] = (byte)((Math.random()*10)+48);  //从 0 生成 0 - 9
			}
		}
		String str = null;
		str = new String( buff, 0, 32 );
		return str;
	}

	public static <T> void setUUIDForBean( T entity, String uuid ){
		Field field = null;
		try {
			Class<?> clazz = entity.getClass().getSuperclass();
			field = clazz.getDeclaredField( "id" );		
			field.setAccessible( true );
			field.set( entity, uuid );
		} catch ( SecurityException | NoSuchFieldException e ) {
			iTrace.print( e );
		} catch ( IllegalAccessException | IllegalArgumentException e ) {
			iTrace.print( e );
		}
	}
	
	public static <T> String setUUIDForBean( T entity ){
		String uuid = createUUID();
		setUUIDForBean( entity, uuid );
		return uuid;
	}

}
