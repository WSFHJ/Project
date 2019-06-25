package com.gec.dao.utils;

import java.lang.reflect.Field;

public class Data {
	
	public Class<?> type;
	public Object value;
	public Data( Class<?> type, Object value ){
		this.type = type;
		this.value = value;
	}
	
	public static <T> Data getProperty( String fldName, T entity ) 
			throws IllegalAccessException {
		Data data = null; 
		try {
			
			Field field = null;
			if( fldName.equals("id") ){
				field = entity.getClass().getSuperclass()
							.getDeclaredField( fldName );
			}else {
				field = entity.getClass().getDeclaredField( fldName );
			}
			field.setAccessible( true );
			data = new Data( field.getType(), field.get(entity) );

		} catch ( NoSuchFieldException | SecurityException e ) {
			throw new IllegalAccessException();
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return data;
	}
}
