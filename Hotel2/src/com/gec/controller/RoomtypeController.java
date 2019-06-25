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
		//Page ��Ҫ���ã�����ҳ��   ���չؼ���  
		Page<Roomtype> tyPage = typeservice.getRoomList(page);
		//�������õ�������չʾ��jspҳ
		req.setAttribute("tyPage", tyPage);
		
		//�ڲ�ת����/WEB-INF/jsp/room/roomList.jsp;
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
