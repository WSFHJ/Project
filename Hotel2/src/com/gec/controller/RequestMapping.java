package com.gec.controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/*
 *  你这一个注解在什么时候是有效, 作用于在什么时间
 *  RetentionPolicy.RUNTIME
 *  在生成字节码之后, 运行时期仍然通过反射可以获取它的信息
 *  RetentionPolicy.SOURCE
 *  只作用在编码时期
 */

//{ps} 定义访问方法的映射地址 (入口点)
//     到时候, 这一个注解将会应用在  UserController 某某方法中..
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RequestMapping {
	public String value() default "";   //它能保存: /login, /register
}
