package com.gec.utils;

import java.lang.reflect.Field;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

public class BeanUtils {
	
	//{ps} 此方法的功能:
	//    {1} 获取 req 表单传递过来的参数..
	//    {2} 根据这些参数, 设置到 clazz 所创建的对象当中..
	//        clazz: User, Movie, Person, 其它的 JavaBean...
	public static <T> T parseBean( HttpServletRequest req, Class<T> clazz )
			throws IllegalAccessException {
		//{1} 获取表单的参数清单名称
		Enumeration<String> paras = req.getParameterNames();
		T bean = null;
		try {
			//{ps} new User(); new Person(); 更多 ..
			bean = clazz.newInstance();
		} catch (InstantiationException e) {
			throw new IllegalAccessException();
		}
		while( paras.hasMoreElements() ){    //{ps} hasMoreElements 相当于 next();
			String fldName = paras.nextElement();   //{ps} 获取到参数名称 ..
			String fldValue = req.getParameter( fldName );   //{ps}可能是: name, age, weight..
			//{ps} 将参数值设置到对象的属性上..
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
			//throw new IllegalAccessException("设置 "+ field.getName() +" 属性失败");
			iTrace.print("设置 "+ field.getName() +" 属性失败");   //{ps} 正常的输出 ..
		}
	}
	
	public static void setProperty(Object bean, String fldName, Object value){
		Class<?> clazz = bean.getClass();
		Field field = null;
		try {
			field = clazz.getDeclaredField( fldName );    //获取全部权限的属性
			field.setAccessible( true );
			setValue( field, bean, value );
		} catch (NoSuchFieldException | SecurityException e) {
			System.out.printf("{BeanUtils} %s 此字段不存在\n", fldName);
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
