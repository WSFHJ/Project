package com.gec.controller;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gec.model.Page;
import com.gec.model.Room;
import com.gec.service.RoomService;


@WebServlet("/Room/*")
public class RoomController extends BaseController{
	
	private RoomService roomService = new RoomService();
	
	@RequestMapping("/viewRoomList")
	protected String viewRoomList(Page page ,HttpServletRequest req ,HttpServletResponse resp){
		//Page 主要作用：接收页码   接收关键字  
		Page<Room> svPage = roomService.getRoomList(page);
		//将它设置到请求域，展示到jsp页
		req.setAttribute("svPage", svPage);
		
		//内部转发：/WEB-INF/jsp/room/roomList.jsp;
		return "forward:/WEB-INF/jsp/room/roomList.jsp";
	}
	
	@RequestMapping("/viewAddRoom")
	protected String viewAddRoom(HttpServletRequest req,HttpServletResponse resp){
		return "forward:/WEB-INF/jsp/room/addRoomList.jsp";
	}
		
	@RequestMapping("/saveRoom")
	public String saveRoom(Room room , HttpServletRequest req, HttpServletResponse resp){
		int i = roomService.saveRoom(room);

		if (i != 1) {
		    return "forward:/WEB-INF/jsp/room/addRoomList.jsp";
		}
		
		return "redirect:/Room/viewRoomList";	
	}

}
