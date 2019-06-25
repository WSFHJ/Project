package com.gec.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.gec.model.Lodger;
import com.gec.model.LodgingInfo;
import com.gec.model.Page;
import com.gec.model.Room;
import com.gec.service.LodgingInfoService;
import com.gec.service.RoomService;

@WebServlet("/LodgingInfo/*")
public class LodgingInfoController extends BaseController {
	
	LodgingInfoService lodInfoService = new LodgingInfoService();
	
	//{ps} 落实映射的写法 ...
	//访问路径: /LodgingInfo/viewRegisterEntry
	@RequestMapping("/viewRegisterEntry")
	protected String viewRegisterEntry(HttpServletRequest req, HttpServletResponse resp){
		//{ps} 只做内部转发 (因为 WEB-INF\下的资源无法直接访问, 所以才这么做 ..)
		return "forward:/WEB-INF/jsp/lodgerInfo/registerEntry.jsp";
	}

	//{ps} 映射地址: /LodgingInfo/saveRegisterEntry
	@RequestMapping("/saveRegisterEntry")
	protected String saveRegisterEntry(LodgingInfo lodInfo, HttpServletRequest req, 
			HttpServletResponse resp){
		//{ps} 搞清楚这一个方法具体的用途 ..
		//{ps} 住客的信息有没有 ?
		//{ps} 选了什么房间, 住多久(开始时间, 结束时间) ?
		String jsonText = lodInfo.getLodgerData();   //{ps} 住客的 json 信息
		JSONArray arr = JSON.parseArray( jsonText );  //生成 Json 对象数组
		List<Lodger> list = new ArrayList();
		for (int i=0; i<arr.size(); i++) {
			//{原始文本} {"phone":"","sex":"a3","certificate":"1","lodgerName":"a1","certificateNo":"a2","isRegister":"0"}
			//把这一串文本 转发一个对象..
			//{ps} arr.getObject(下标,Bean字节码);
			Lodger lodger = arr.getObject(i, Lodger.class);
			list.add( lodger );   //{ps} 保存到  list 集合
			if( lodger.getIsRegister().equals("1") ){
				//{ps} 登记人的名字
				lodInfo.setRegisterName( lodger.getLodgerName() );
			}
		}
		//{ps} 调用 Service 来创建订单到数据库
		LodgingInfo lodgingInfo = lodInfoService.saveLodgingInfo(lodInfo, list);
		HttpSession session = req.getSession( false );
		session.setAttribute("lodgingInfo", lodgingInfo);   //{ps} 设置到会话域 ..
		//到时 在  "viewLodgingInfoList" 方法中取出
		return "redirect:/LodgingInfo/viewLodgingInfoList";
	}
	
	@RequestMapping("/viewLodgingInfoList")
	protected String viewLodgingInfoList(LodgingInfo lodInfo, HttpServletRequest req, 
			HttpServletResponse resp) {
		HttpSession session = req.getSession( false );
		LodgingInfo lodgingInfo = (LodgingInfo)session.getAttribute("lodgingInfo");
		List<LodgingInfo> list = new ArrayList();
		if( lodgingInfo!=null ){
			list.add( lodgingInfo );
			session.removeAttribute("lodgingInfo");  //{ps} 从会话域中清除该属性 ..
		}else{
			//{ps} 从数据库拿到所有的清单 ..
			//list = xxxService.xxxx();
		    list = lodInfoService.saveLodgingInfo();
		}
		req.setAttribute("list", list);
		return "forward:/WEB-INF/jsp/lodgerInfo/lodInfoList.jsp";
	}
	
	
	//  /LodgingInfo/viewOrderEntry
	@RequestMapping("/viewOrderEntry")
	protected String viewOrderEntry( LodgingInfo lodInfo ,HttpServletRequest req , HttpServletResponse resp){
		return "redirect:/LodgingInfo/viewLodgingInfoList";
	}
	
	private RoomService roomService = new RoomService();
	
	@RequestMapping("/viewStateList")
	protected String viewStateList(Page page ,HttpServletRequest req ,HttpServletResponse resp){
		//Page 主要作用：接收页码   接收关键字  
		Page<Room> svPage = roomService.getStateList(page);
//		Page<Room> svPage = roomService.getRoomList(page);
		//将它设置到请求域，展示到jsp页
		req.setAttribute("svPage", svPage);
		
		//内部转发：/WEB-INF/jsp/room/roomList.jsp;
		return "forward:/WEB-INF/jsp/lodgerInfo/stateList.jsp";
	}
	
	
	@RequestMapping("/viewStateChange")
	protected String viewStateChange(Page page ,HttpServletRequest req ,HttpServletResponse resp){
		//Page 主要作用：接收页码   接收关键字  
		Page<Room> svPage = roomService.getRoomList(page);
		//将它设置到请求域，展示到jsp页
		req.setAttribute("svPage", svPage);
		
		//内部转发：/WEB-INF/jsp/room/roomList.jsp;
		return "forward:/WEB-INF/jsp/lodgerInfo/stateChange.jsp";
	}
	
	@RequestMapping("/saveState")
	protected String saveState(Room room , HttpServletRequest req ,HttpServletResponse resp){
		int i = roomService.setStatus(room);
        
        if (i>0){
             return "redirect:/LodgingInfo/viewStateChange";
        }
        return "forward:/WEB-INF/jsp/lodgerInfo/statefail.jsp";
       
	}
}

//iTrace.print( lodInfo.getDeposit()    );   //{ps} 收了多少押金
//iTrace.print( lodInfo.getEntryDate()  );   //入住时间
//iTrace.print( lodInfo.getLeaveDate()  );   //离店时间
//iTrace.print( lodInfo.getOperatorId() );   //谁开的单

