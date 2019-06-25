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
		�������� : �û���½		
		(a) userSerive.doLogin
		(b) ���� makeMenus ���������˵���
		(c) ���� session �Ự (�����Ự, ��������)
		(d) �ڲ�ת��
	 */
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest req, HttpServletResponse resp){
		User svUser = userService.doLogin( user );
		if( svUser!=null ){   //{ps} ����û���½�ɹ�..
			//{ps} makeMenus( �����ɫID );
			makeMenus( svUser.getRoleId() );  //{ps} �����˵�, ���������� ..
			//{ps} ���� session �Ự
			HttpSession session = req.getSession();
			session.setAttribute("user", svUser);   //{ps} �����û����Ự�� ..
			//{ps} �ڲ�ת��: ���� ??
			return "forward:/WEB-INF/jsp/index.jsp";   //{ps} ϵͳ�Ŀ��ҳ
//			return "forward:/WEB-INF/jsp/lodgerInfo/registerEntry.jsp";
		}
		return "redirect:/login.jsp?errorcode=1";      //{ps} ���ص�ԭ��λ��: login.jsp
	}
	
	/*
		����˵��: ��ȡ�˵�  ��  Ȩ������
			         ���õ�Ӧ�ó�����
		����˵��:
		2-1: (a)��Ӧ�ó������л�ȡ menuMap(�˵�Map)
		     (b)userService.getRoleMenus(��ɫID);
		
		2-2: (a)��ȡ authSet(Ȩ��Set)
		     (b)userService.getAuthority(��ɫID);
		
		2-3: �����Ǵ���  "Ӧ�ó�����"
			(a)���� menuMap ʱ, �� [menu_roleId] ��Ϊ��
			(b)���� authSet ʱ, �� [author_roleId] ��Ϊ��
	 * */
	private void makeMenus(String roleId){
		//{ps} ���֮ǰ��ȥ���ݿ��ù�һ��, �ͻᱣ���� application Scope ��
		//{ps} ��λ�ȡ  �����Ķ��� ?
		ServletContext context = getServletContext();
		String key = "menu_"+ roleId;
		//{ps} ����ͼȥ���л�ȡ�뵱ǰ��ɫ��Ӧ��  menuMap
		Map<String,Menu> menuMap = (Map)context.getAttribute( key );
		if( menuMap==null ){
			//{ps} userService.getRoleMenus(��ɫID);
			Map<String,Menu> roleMenu = userService.getRoleMenus( roleId );
			//{ps} �����Ǵ���  "Ӧ�ó�����"
			context.setAttribute(key, roleMenu);
		}
	}
	
	//�˳���¼
	@RequestMapping("/logout")
	public String logout(User user, HttpServletRequest req, HttpServletResponse resp){
			System.out.println("�û����˳�������");
			HttpSession session = req.getSession(false);
			if (session!=null) {
				session.invalidate();
			}
			return "redirect:/login.jsp?errorcode=2";
			//�˳���¼
	}
	
}




	