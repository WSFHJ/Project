package com.gec.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gec.model.Page;
import com.gec.model.Roomtype;
import com.gec.service.TypeService;

@WebServlet("/RoomType/*")
public class RoomtypeController extends BaseController{
	
	private TypeService typeservice = new TypeService();
	
	@RequestMapping("/viewTypeList")
	protected String viewTypeList(Page page ,HttpServletRequest req ,HttpServletResponse resp){
		//Page 主要作用：接收页码   接收关键字  
		Page<Roomtype> tyPage = typeservice.getRoomList(page);
		//将它设置到请求域，展示到jsp页
		req.setAttribute("tyPage", tyPage);
		
		//内部转发：/WEB-INF/jsp/room/roomList.jsp;
		return "forward:/WEB-INF/jsp/roomtype/typeList.jsp";
	}
	
	@RequestMapping("/viewAddType")
	protected String viewAddRoom(HttpServletRequest req,HttpServletResponse resp){
		return "forward:/WEB-INF/jsp/roomtype/addTypeList.jsp";
	}
		
	@RequestMapping("/saveType")
	public String saveRoom(Roomtype roomtype , HttpServletRequest req, HttpServletResponse resp){
		int i = typeservice.saveType(roomtype);

		if (i != 1) {
		    return "forward:/WEB-INF/jsp/roomtype/addTypeList.jsp";
		}
		
		return "redirect:/RoomType/viewTypeList";	
	}

}
