package com.gec.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gec.utils.BeanUtils;
import com.gec.utils.iTrace;

public class BaseController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//{1} ���� ���� �� ��Ӧ �ı����ʽ
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		//{2} ������Ӧ�����ĵ���������
		resp.setContentType("text/html;charset=UTF-8");
		//{3} �õ� req �� URI ��ַ
		String uri = req.getRequestURI();
		String methodName = getURIPattern(uri);
		iTrace.print( "������: "+ methodName );
		Method method = getAnnotationMethod( methodName );
		if( method!=null ){  //{ps} �ҵõ�һ������ ..
			iTrace.print( method );
			//{ps}
			String result = null;
			try {
				//result: �ض���, �ڲ�ת��, ...
				result = proccessAction(method, req, resp);
				if( result!=null ){
					//{ps} ����  parseResult �������, ���������� ..
					parseResult(result, req, resp);
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}else{
			//{ps} �ض���һ�� 404 ��ʾҳ
		}
	}
	//{1} ��ȡ��ַ�ϵ����һ��ӳ���
	private String getURIPattern(String uri){
		int index = uri.lastIndexOf("/");
		return uri.substring( index+1, uri.length());
	}

	//{ps} ͨ��������, ����ȡ�ѱ�����Ӧע��ķ��� ...
	private Method getAnnotationMethod(String urlPattern) {
		urlPattern = "/" + urlPattern;
		//{1} ��ȡ��ǰ������ֽ��� ..
		Class<?> clazz = this.getClass(); //{ps} ��һ�� this ==> UserController(new ˭����˭)
		//{2} ��ȡ UserController �������������ķ��� ..
		Method[] methods = clazz.getDeclaredMethods();
		//{3} ����ÿһ������
		for (Method method : methods) {
			//{4} ȡ�������� ע�����
			RequestMapping map = method.getAnnotation( RequestMapping.class );
			//{5} ȡ��ע������ "ע��ֵ" (��һ��ÿ����������ע��)
			if( map!=null ){  //{ps} ��������ע�����, ȥ��ȡ����ֵ
				String value = map.value();
				if( value.equals( urlPattern ) ){  //{ps} value=="/login"
					return method;    //{ps} ���ص�ǰ���� ..
				}
			}
		}
		return null;
	}

	//{ps}
	private String proccessAction( Method action, HttpServletRequest req, 
			HttpServletResponse resp ) throws IllegalAccessException, IOException {
		//{1} ��ȡ UserController ��ǰ�������βεĸ���
		int parCnt = action.getParameterCount();
		//{2} ���ж� �� == 2 �� ==3
		if( parCnt!=2 && parCnt!=3 ){
			//�ض���һ������ҳ [ ���� ]
			iTrace.print( "��������������Ҫ��: ִ���ض��� ..." );
			return null;
		}
		//{3} ��ȡ�β������б� ..
		Class<?>[] parTypes = action.getParameterTypes();
		//{4} ����һ���β�ֵ���б� ..
		Object[] values = new Object[ parCnt ];  //������ parCnt һ�� ..
		
		//{ps} ���ø�ʽ: getMethodInfo(�����б�, �β�ֵ���б�, req, resp);
		MethodInfo mi = getMethodInfo(parTypes, values, req, resp);
		//{5} ��һ���ж�: 
		//    �����������������ж���, ��Ϊ����: �涨�� parCnt==2 or parCnt==3
		String result = null;
		if( mi.reqCount==1 && mi.respCount==1 ){
			//{ps} ���� OK, ��������ô�� ?
			//String callMethod(Method action, MethodInfo info, 
			//			HttpServletRequest req,	Object[] values);
			//result: 
			// ֵ1: "redirect:/reg_ok.jsp";    //{ps} �ض���
			// ֵ2: "forward:/success.jsp"     //{ps} �ڲ�ת��
			// ֵ3: "data:Helloworld.."	      //{ps} �����ı����� [json ����]
			// ֵ4: null
			result = callMethod( action, mi, req, values );
			return result;
		}
		return null;
	}
	
	//{ps} �������� :
	//����(1) --- ���� User ���� (���÷���)
	//����(2) --- �� User ������������ (���÷���)
	//����(3) --- �����÷���
	//     ���� UserController.login ����
	//     ���� UserController.register ����
	private String callMethod(Method action, MethodInfo info, 
			HttpServletRequest req,	Object[] values) 
			throws IllegalAccessException {
		//{ps} ����Ҫ��Ҫ����  User ���� ..
		Object bean = null;
		if( info.otherCount==1 ){   //{ps} ֤��  User �����Ǵ��ڵ�..
			//{1} ����  Bean(user) ����.. 
			//{2} ��  Form ���Ĳ���, ���õ�  User ���ϵ��������� (����Ķ��� ..)
			bean = BeanUtils.parseBean(req, info.beanClass);
			values[info.beanPos] = bean;   //{ps} ���� user ���� values ��
		}
		action.setAccessible( true );   //{ps} �򿪷����ķ���Ȩ�� ..
		try {
			//{ps} ���÷���: user.login / user.register / ��������..
			//��ʽ: action.invoke( ��ǰ����(UserController), ����ֵ�б�  );
			return (String)action.invoke(this, values);
		} catch (IllegalArgumentException e) {
			throw new IllegalAccessException();
		} catch ( InvocationTargetException e){
			Throwable cause = e.getCause();    //{ps} �쳣������Դͷ
			cause.printStackTrace();  //{ps} ��ӡջ������Ϣ, �Ա����ǵ��Դ��� ..
		}
		return null;
	}
	
	//{ps} �ڲ���
	class MethodInfo {
		int reqCount = 0;         //{ps} ��������ĸ���: HttpServletRequest
		int respCount = 0;        //{ps} ��Ӧ�����ĸ���
		int otherCount = 0;       //{ps} ���������ĸ���: User, Movie, Log, ..
		Class<?> beanClass = null;  //{ps} �����������������ʲô������: User.class, Movie.class
		                            //     �ṩ�����淴����÷���ʱ, �������� Bean ����
		int beanPos = -1;           //{ps} �������: user ���β��б��е�λ��
	}
	
	//{ps} �ܽ�:
	// [1] ��һ��������Ҫ�ǽ�ʵ�ε�ֵ����  values ���鵱��(�����ǶԺŵ�)
	// [2] ���� bean ���ֽ���(User.class)
	//     ���� bean ���ڵ�λ��
	private MethodInfo getMethodInfo(Class<?>[] types, Object[] values, 
			HttpServletRequest req, HttpServletResponse resp){
		Class parClass;
		MethodInfo mi = new MethodInfo();
		for (int i = 0; i<types.length; i++) {
			parClass = types[i];
			if( parClass==HttpServletRequest.class ){
				values[i] = req;     //{ps} ���� req (����) ���� ..
				mi.reqCount += 1;    //{ps} �������Ϊ: +1 (����)
				iTrace.print("������� req �� ["+ i +"] ��λ��");
			}else if( parClass==HttpServletResponse.class ){
				values[i] = resp;     //{ps} ���� resp (��Ӧ) ���� ..
				mi.respCount += 1;    //{ps} ��Ӧ����Ϊ: +1 (����)
				iTrace.print("������� resp �� ["+ i +"] ��λ��");
			}else{  //{ps} ��һ���Ϳ϶���: User.class, Movie.class, ���� ..
				mi.beanPos = i;            //{ps} ���� bean ������λ��
				mi.beanClass = parClass;   //{ps} ���� bean ���ֽ��� (����ʲô����)
				mi.otherCount += 1;        //{ps} ��������Ϊ: +1 (����)
				iTrace.print("��¼  User ����λ��  ["+ i +"]");
				iTrace.print("��¼  User �� Class ["+ parClass +"]");
			}
		}
		return mi;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doGet( req, resp );
	}

	//{ps} ������� result, ���� doResponse
	private void parseResult(String result, HttpServletRequest req, 
			HttpServletResponse resp) throws IllegalAccessException, IOException{
		//{1} Ҫʹ��������ʽ, �������� ...
		String reg = "([^:]+):(.+)";
		Pattern pat = Pattern.compile( reg );
		Matcher mat = pat.matcher( result );
		if( mat.matches() ){
			//{1} ȡ���� 1 (ִ�еĲ���)
			String action = mat.group(1);     //{ps} ����ֵΪ: redirect, forward, data,..
			//{2} ȡ���� 2: (�������������) 
			String content = mat.group(2);    //{ps} ����ֵΪ: index.jsp, helloworld,..
			//{3} ����  doResponse, ����ͨ��������� BaseController(�� UserController)�ķ�����
			doResponse(action, content, req, resp);
		}
	}

	//{ps} ͨ������������  redirect, data, forward ��Щ������
	private void doResponse(String methodName, String content, 
				HttpServletRequest req, HttpServletResponse resp ) 
						throws IllegalAccessException, IOException {
		//{1} ����, ��Ҫ���� BaseController �ķ���
		//{2} Ҫ�õ� BaseController �� Class ����
		//    this.getClass();  //�õ�  UserController.class
		Class clazz = this.getClass().getSuperclass();   //{ps} �õ� BaseController.class
		//{3} ��ȡ redirect, forward, data ��������һ��
		//    ���ø�ʽ: clazz.getDeclaredMethod( ������, �β��б� );
		try {
			Method respMtd = clazz.getDeclaredMethod( methodName, String.class, HttpServletRequest.class,
									HttpServletResponse.class );
			//{ps} respMtd.invoke( ��������(UserController), �βε�ֵ�б�  );
			respMtd.invoke( this, content, req, resp );
		} catch (NoSuchMethodException | SecurityException e) {
			throw new IllegalAccessException();
		} catch (IllegalArgumentException | InvocationTargetException e) {
			throw new IllegalAccessException();
		}
	}
	
	//{ps} content ����ʲôֵ: �ض���ĵ�ַ
	//     ������������: /index.jsp,  /User/login (���ﲻ������Ŀ�ĸ�·��)
	//     �����Լ�Ҫ׷�� (��Ŀ�ĸ�·��)
	private void redirect(String content, HttpServletRequest req, HttpServletResponse resp) 
			throws IOException {
		String ctxPath = req.getContextPath();    //{ps} ��Ŀ�ĸ�·��
		resp.sendRedirect( ctxPath + content );   //{ps} �ض���
	}

	//{ps} content ����ʲôֵ: �ڲ�ת���ĵ�ַ
	//     ������������:  /index.jsp,  /User/login (���ﲻ������Ŀ�ĸ�·��)
	private void forward(String content, HttpServletRequest req, HttpServletResponse resp) 
			throws IOException, ServletException {
		req.getRequestDispatcher( content )
		.forward(req, resp);    //{ps} �ڲ�ת�� ..
	}

	//{ps} ��һ��������������ݵ�ҳ��
	//     ����: {name:andy,age:100}
	private void data(String content, HttpServletRequest req, HttpServletResponse resp ) 
			throws IOException {
		iTrace.print();
		resp.getWriter().write( content );   //{ps} ��������..
	}

	protected int getPage(HttpServletRequest req){ return 0; }

}
