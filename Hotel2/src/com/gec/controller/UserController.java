package com.gec.controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gec.model.Menu;
import com.gec.model.User;
import com.gec.service.UserService;

@WebServlet("/User/*")
public class UserController extends BaseController {
	UserService userService = new UserService();
	/*
		方法功能 : 用户登陆		
		(a) userSerive.doLogin
		(b) 调用 makeMenus 方法产生菜单。
		(c) 处理 session 会话 (创建会话, 保存数据)
		(d) 内部转发
	 */
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest req, HttpServletResponse resp){
		User svUser = userService.doLogin( user );
		if( svUser!=null ){   //{ps} 如果用户登陆成功..
			//{ps} makeMenus( 传入角色ID );
			makeMenus( svUser.getRoleId() );  //{ps} 产生菜单, 并保存起来 ..
			//{ps} 处理 session 会话
			HttpSession session = req.getSession();
			session.setAttribute("user", svUser);   //{ps} 保存用户到会话域 ..
			//{ps} 内部转发: 哪里 ??
			return "forward:/WEB-INF/jsp/index.jsp";   //{ps} 系统的框架页
//			return "forward:/WEB-INF/jsp/lodgerInfo/registerEntry.jsp";
		}
		return "redirect:/login.jsp?errorcode=1";      //{ps} 返回到原来位置: login.jsp
	}
	
	/*
		功能说明: 获取菜单  与  权限数据
			         设置到应用程序域
		流程说明:
		2-1: (a)从应用程序域中获取 menuMap(菜单Map)
		     (b)userService.getRoleMenus(角色ID);
		
		2-2: (a)获取 authSet(权限Set)
		     (b)userService.getAuthority(角色ID);
		
		2-3: 将它们存入  "应用程序域"
			(a)存入 menuMap 时, 以 [menu_roleId] 作为键
			(b)存入 authSet 时, 以 [author_roleId] 作为键
	 * */
	private void makeMenus(String roleId){
		//{ps} 如果之前已去数据库拿过一次, 就会保存在 application Scope 中
		//{ps} 如何获取  上下文对象 ?
		ServletContext context = getServletContext();
		String key = "menu_"+ roleId;
		//{ps} 先试图去域中获取与当前角色对应的  menuMap
		Map<String,Menu> menuMap = (Map)context.getAttribute( key );
		if( menuMap==null ){
			//{ps} userService.getRoleMenus(角色ID);
			Map<String,Menu> roleMenu = userService.getRoleMenus( roleId );
			//{ps} 将它们存入  "应用程序域"
			context.setAttribute(key, roleMenu);
		}
	}
	
	//退出登录
	@RequestMapping("/logout")
	public String logout(User user, HttpServletRequest req, HttpServletResponse resp){
			System.out.println("用户已退出。。。");
			HttpSession session = req.getSession(false);
			if (session!=null) {
				session.invalidate();
			}
			return "redirect:/login.jsp?errorcode=2";
			//退出登录
	}
	
}




	