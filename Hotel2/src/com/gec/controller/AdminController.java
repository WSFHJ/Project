package com.gec.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gec.model.Page;
import com.gec.model.User;
import com.gec.service.UserService;

@WebServlet("/Admin/*")
public class AdminController extends BaseController {
	
	private UserService userService = new UserService();
	
	@RequestMapping("/viewUserList")
	public String viewUserList(Page page ,HttpServletRequest req, HttpServletResponse resp){
		Page<User> usPage = userService.getUserList(page);
		
		req.setAttribute("usPage", usPage);
		
		return "forward:/WEB-INF/jsp/admin/viewUserList.jsp";	
	}
	
	//新增用户
	@RequestMapping("/viewAddUser")
	public String viewAddUser(HttpServletRequest req, HttpServletResponse resp){
		return "forward:/WEB-INF/jsp/admin/viewAddUser.jsp";	
	}
	
	//保存用户 /Admin/saveUser
	@RequestMapping("/saveUser")
	public String saveUser(User user , HttpServletRequest req, HttpServletResponse resp){
	    int i = userService.saveUser(user);
//	    System.out.println(user);
//	    return null;
	    if (i != 1) {
	    	return "forward:/WEB-INF/jsp/admin/viewAddUser.jsp";
		}
		return "redirect:/Admin/viewUserList";	
	}
	
	//删除用户
	@RequestMapping("/delUser")
	public String delUser(User user , HttpServletRequest req, HttpServletResponse resp){
		
//		return "redirect:/Admin/viewUserList";
		int i = userService.delUser(user);
		
	    if (i != 1) {
	    	return "forward:/WEB-INF/jsp/admin/viewAddUser.jsp";
	    	
		}
		return "redirect:/Admin/viewUserList";	
	}
	
}
