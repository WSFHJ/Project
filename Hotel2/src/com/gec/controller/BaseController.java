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
		//{1} 设置 请求 与 响应 的编码格式
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		//{2} 设置响应体正文的内容类型
		resp.setContentType("text/html;charset=UTF-8");
		//{3} 得到 req 的 URI 地址
		String uri = req.getRequestURI();
		String methodName = getURIPattern(uri);
		iTrace.print( "方法名: "+ methodName );
		Method method = getAnnotationMethod( methodName );
		if( method!=null ){  //{ps} 我得到一个方法 ..
			iTrace.print( method );
			//{ps}
			String result = null;
			try {
				//result: 重定向, 内部转发, ...
				result = proccessAction(method, req, resp);
				if( result!=null ){
					//{ps} 调用  parseResult 解析结果, 做后续处理 ..
					parseResult(result, req, resp);
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}else{
			//{ps} 重定向到一个 404 显示页
		}
	}
	//{1} 获取地址上的最后一个映射符
	private String getURIPattern(String uri){
		int index = uri.lastIndexOf("/");
		return uri.substring( index+1, uri.length());
	}

	//{ps} 通过方法名, 来获取已标有相应注解的方法 ...
	private Method getAnnotationMethod(String urlPattern) {
		urlPattern = "/" + urlPattern;
		//{1} 获取当前对象的字节码 ..
		Class<?> clazz = this.getClass(); //{ps} 这一个 this ==> UserController(new 谁就是谁)
		//{2} 获取 UserController 的所有已声明的方法 ..
		Method[] methods = clazz.getDeclaredMethods();
		//{3} 迭代每一个方法
		for (Method method : methods) {
			//{4} 取出方法上 注解对象
			RequestMapping map = method.getAnnotation( RequestMapping.class );
			//{5} 取出注解对象的 "注解值" (不一定每个方法都有注解)
			if( map!=null ){  //{ps} 当存在有注解对象, 去获取它的值
				String value = map.value();
				if( value.equals( urlPattern ) ){  //{ps} value=="/login"
					return method;    //{ps} 返回当前方法 ..
				}
			}
		}
		return null;
	}

	//{ps}
	private String proccessAction( Method action, HttpServletRequest req, 
			HttpServletResponse resp ) throws IllegalAccessException, IOException {
		//{1} 获取 UserController 当前方法的形参的个数
		int parCnt = action.getParameterCount();
		//{2} 再判断 它 == 2 或 ==3
		if( parCnt!=2 && parCnt!=3 ){
			//重定向到一个错误页 [ 待定 ]
			iTrace.print( "参数个数不符合要求: 执行重定向 ..." );
			return null;
		}
		//{3} 获取形参类型列表 ..
		Class<?>[] parTypes = action.getParameterTypes();
		//{4} 定义一个形参值的列表 ..
		Object[] values = new Object[ parCnt ];  //个数与 parCnt 一样 ..
		
		//{ps} 调用格式: getMethodInfo(类型列表, 形参值的列表, req, resp);
		MethodInfo mi = getMethodInfo(parTypes, values, req, resp);
		//{5} 作一个判断: 
		//    其它参数个数不作判断了, 因为上面: 规定了 parCnt==2 or parCnt==3
		String result = null;
		if( mi.reqCount==1 && mi.respCount==1 ){
			//{ps} 条件 OK, 接下来怎么样 ?
			//String callMethod(Method action, MethodInfo info, 
			//			HttpServletRequest req,	Object[] values);
			//result: 
			// 值1: "redirect:/reg_ok.jsp";    //{ps} 重定向
			// 值2: "forward:/success.jsp"     //{ps} 内部转发
			// 值3: "data:Helloworld.."	      //{ps} 发送文本数据 [json 数据]
			// 值4: null
			result = callMethod( action, mi, req, values );
			return result;
		}
		return null;
	}
	
	//{ps} 功能描述 :
	//功能(1) --- 创建 User 对象 (利用反射)
	//功能(2) --- 对 User 中属性作设置 (利用反射)
	//功能(3) --- 最后调用方法
	//     调用 UserController.login 方法
	//     调用 UserController.register 方法
	private String callMethod(Method action, MethodInfo info, 
			HttpServletRequest req,	Object[] values) 
			throws IllegalAccessException {
		//{ps} 到底要不要创建  User 对象 ..
		Object bean = null;
		if( info.otherCount==1 ){   //{ps} 证明  User 参数是存在的..
			//{1} 创建  Bean(user) 对象.. 
			//{2} 将  Form 表单的参数, 设置到  User 身上的所有属性 (能填的都填 ..)
			bean = BeanUtils.parseBean(req, info.beanClass);
			values[info.beanPos] = bean;   //{ps} 填入 user 对象到 values 中
		}
		action.setAccessible( true );   //{ps} 打开方法的访问权限 ..
		try {
			//{ps} 调用方法: user.login / user.register / 其它方法..
			//格式: action.invoke( 当前对象(UserController), 参数值列表  );
			return (String)action.invoke(this, values);
		} catch (IllegalArgumentException e) {
			throw new IllegalAccessException();
		} catch ( InvocationTargetException e){
			Throwable cause = e.getCause();    //{ps} 异常引发的源头
			cause.printStackTrace();  //{ps} 打印栈跟踪信息, 以便我们调试代码 ..
		}
		return null;
	}
	
	//{ps} 内部类
	class MethodInfo {
		int reqCount = 0;         //{ps} 请求参数的个数: HttpServletRequest
		int respCount = 0;        //{ps} 响应参数的个数
		int otherCount = 0;       //{ps} 其它参数的个数: User, Movie, Log, ..
		Class<?> beanClass = null;  //{ps} 保存的其它参数中是什么类型如: User.class, Movie.class
		                            //     提供给后面反射调用方法时, 用来创建 Bean 对象。
		int beanPos = -1;           //{ps} 保存的是: user 在形参列表中的位置
	}
	
	//{ps} 总结:
	// [1] 这一个方法主要是将实参的值填入  values 数组当中(而且是对号的)
	// [2] 保存 bean 的字节码(User.class)
	//     保存 bean 所在的位置
	private MethodInfo getMethodInfo(Class<?>[] types, Object[] values, 
			HttpServletRequest req, HttpServletResponse resp){
		Class parClass;
		MethodInfo mi = new MethodInfo();
		for (int i = 0; i<types.length; i++) {
			parClass = types[i];
			if( parClass==HttpServletRequest.class ){
				values[i] = req;     //{ps} 填入 req (请求) 对象 ..
				mi.reqCount += 1;    //{ps} 请求参数为: +1 (记数)
				iTrace.print("填入参数 req 到 ["+ i +"] 号位置");
			}else if( parClass==HttpServletResponse.class ){
				values[i] = resp;     //{ps} 填入 resp (响应) 对象 ..
				mi.respCount += 1;    //{ps} 响应参数为: +1 (记数)
				iTrace.print("填入参数 resp 到 ["+ i +"] 号位置");
			}else{  //{ps} 这一个就肯定是: User.class, Movie.class, 另外 ..
				mi.beanPos = i;            //{ps} 保存 bean 的所在位置
				mi.beanClass = parClass;   //{ps} 保存 bean 的字节码 (它是什么类型)
				mi.otherCount += 1;        //{ps} 其它参数为: +1 (记数)
				iTrace.print("记录  User 参数位置  ["+ i +"]");
				iTrace.print("记录  User 的 Class ["+ parClass +"]");
			}
		}
		return mi;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doGet( req, resp );
	}

	//{ps} 解析结果 result, 调用 doResponse
	private void parseResult(String result, HttpServletRequest req, 
			HttpServletResponse resp) throws IllegalAccessException, IOException{
		//{1} 要使用正则表达式, 来做解析 ...
		String reg = "([^:]+):(.+)";
		Pattern pat = Pattern.compile( reg );
		Matcher mat = pat.matcher( result );
		if( mat.matches() ){
			//{1} 取出组 1 (执行的操作)
			String action = mat.group(1);     //{ps} 可能值为: redirect, forward, data,..
			//{2} 取出组 2: (具体操作的内容) 
			String content = mat.group(2);    //{ps} 可能值为: index.jsp, helloworld,..
			//{3} 调用  doResponse, 它会通过反射调用 BaseController(非 UserController)的方法。
			doResponse(action, content, req, resp);
		}
	}

	//{ps} 通过反射来调用  redirect, data, forward 这些方法。
	private void doResponse(String methodName, String content, 
				HttpServletRequest req, HttpServletResponse resp ) 
						throws IllegalAccessException, IOException {
		//{1} 现在, 我要调用 BaseController 的方法
		//{2} 要拿到 BaseController 的 Class 对象
		//    this.getClass();  //得到  UserController.class
		Class clazz = this.getClass().getSuperclass();   //{ps} 得到 BaseController.class
		//{3} 获取 redirect, forward, data 方法其中一个
		//    调用格式: clazz.getDeclaredMethod( 方法名, 形参列表 );
		try {
			Method respMtd = clazz.getDeclaredMethod( methodName, String.class, HttpServletRequest.class,
									HttpServletResponse.class );
			//{ps} respMtd.invoke( 主调对象(UserController), 形参的值列表  );
			respMtd.invoke( this, content, req, resp );
		} catch (NoSuchMethodException | SecurityException e) {
			throw new IllegalAccessException();
		} catch (IllegalArgumentException | InvocationTargetException e) {
			throw new IllegalAccessException();
		}
	}
	
	//{ps} content 传入什么值: 重定向的地址
	//     可能是这样的: /index.jsp,  /User/login (这里不包含项目的根路径)
	//     我们自己要追加 (项目的根路径)
	private void redirect(String content, HttpServletRequest req, HttpServletResponse resp) 
			throws IOException {
		String ctxPath = req.getContextPath();    //{ps} 项目的根路径
		resp.sendRedirect( ctxPath + content );   //{ps} 重定向
	}

	//{ps} content 传入什么值: 内部转发的地址
	//     可能是这样的:  /index.jsp,  /User/login (这里不包含项目的根路径)
	private void forward(String content, HttpServletRequest req, HttpServletResponse resp) 
			throws IOException, ServletException {
		req.getRequestDispatcher( content )
		.forward(req, resp);    //{ps} 内部转发 ..
	}

	//{ps} 这一个方法是输出内容到页面
	//     发送: {name:andy,age:100}
	private void data(String content, HttpServletRequest req, HttpServletResponse resp ) 
			throws IOException {
		iTrace.print();
		resp.getWriter().write( content );   //{ps} 发送数据..
	}

	protected int getPage(HttpServletRequest req){ return 0; }

}
