package com.gec.utils;

import java.lang.reflect.Field;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

public class BeanUtils {
	
	//{ps} �˷����Ĺ���:
	//    {1} ��ȡ req �����ݹ����Ĳ���..
	//    {2} ������Щ����, ���õ� clazz �������Ķ�����..
	//        clazz: User, Movie, Person, ������ JavaBean...
	public static <T> T parseBean( HttpServletRequest req, Class<T> clazz )
			throws IllegalAccessException {
		//{1} ��ȡ���Ĳ����嵥����
		Enumeration<String> paras = req.getParameterNames();
		T bean = null;
		try {
			//{ps} new User(); new Person(); ���� ..
			bean = clazz.newInstance();
		} catch (InstantiationException e) {
			throw new IllegalAccessException();
		}
		while( paras.hasMoreElements() ){    //{ps} hasMoreElements �൱�� next();
			String fldName = paras.nextElement();   //{ps} ��ȡ���������� ..
			String fldValue = req.getParameter( fldName );   //{ps}������: name, age, weight..
			//{ps} ������ֵ���õ������������..
			setProperty( bean, fldName, fldValue );
		}
		return bean;
	}
	
	public static void setValue(Field field, Object bean, Object value) 
			throws IllegalAccessException {
		Class<?> valType = field.getType();
		String cVal = value.toString();
		try{
			if( value!=null ){ 
				if( valType==String.class ){
					field.set(bean, value);
				}else if( valType==int.class || valType==Integer.class ){
					field.set(bean, Integer.valueOf( cVal ));
				}else if( valType==double.class || valType==Double.class ){
					field.set(bean, Double.valueOf( cVal ));
				}
			}
		}catch(IllegalArgumentException | IllegalAccessException e){
			//throw new IllegalAccessException("���� "+ field.getName() +" ����ʧ��");
			iTrace.print("���� "+ field.getName() +" ����ʧ��");   //{ps} ��������� ..
		}
	}
	
	public static void setProperty(Object bean, String fldName, Object value){
		Class<?> clazz = bean.getClass();
		Field field = null;
		try {
			field = clazz.getDeclaredField( fldName );    //��ȡȫ��Ȩ�޵�����
			field.setAccessible( true );
			setValue( field, bean, value );
		} catch (NoSuchFieldException | SecurityException e) {
			System.out.printf("{BeanUtils} %s ���ֶβ�����\n", fldName);
		} catch( IllegalArgumentException | IllegalAccessException e){
			e.printStackTrace();
		}
	}

	public static Object getProperty(Object bean, String fldName) {
		Class<?> clazz = bean.getClass();
		Field field = null;
		try {
			field = clazz.getDeclaredField( fldName );
			field.setAccessible(true);
			return field.get( bean );
		} catch (NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
		} catch( IllegalArgumentException | IllegalAccessException e){
			e.printStackTrace();
		}
		return null;
	}

}
