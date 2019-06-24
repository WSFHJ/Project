package com.gec.dao.utils;

import java.lang.reflect.Field;
import com.gec.utils.iTrace;

public class EntityTool {
	
	//��ȡһ�� 32 λ�� UUID ����
	public static String createUUID(){
		byte[] buff = new byte[32];   // 32 ���ֽ�  byte ����, ��ĸ + ��ѧ ������
		for(int i=0; i<32; i++){
			int r = (int)(Math.random()*2);  //���� 0- 1 �����
			if( r==0){
				buff[i] = (byte)((Math.random()*26)+97);  //�� a ���� a-z
			}else{
				buff[i] = (byte)((Math.random()*10)+48);  //�� 0 ���� 0 - 9
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
