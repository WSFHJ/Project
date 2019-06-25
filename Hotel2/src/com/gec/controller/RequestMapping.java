package com.gec.controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/*
 *  ����һ��ע����ʲôʱ������Ч, ��������ʲôʱ��
 *  RetentionPolicy.RUNTIME
 *  �������ֽ���֮��, ����ʱ����Ȼͨ��������Ի�ȡ������Ϣ
 *  RetentionPolicy.SOURCE
 *  ֻ�����ڱ���ʱ��
 */

//{ps} ������ʷ�����ӳ���ַ (��ڵ�)
//     ��ʱ��, ��һ��ע�⽫��Ӧ����  UserController ĳĳ������..
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RequestMapping {
	public String value() default "";   //���ܱ���: /login, /register
}
