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
	
	//{ps} ��ʵӳ���д�� ...
	//����·��: /LodgingInfo/viewRegisterEntry
	@RequestMapping("/viewRegisterEntry")
	protected String viewRegisterEntry(HttpServletRequest req, HttpServletResponse resp){
		//{ps} ֻ���ڲ�ת�� (��Ϊ WEB-INF\�µ���Դ�޷�ֱ�ӷ���, ���Բ���ô�� ..)
		return "forward:/WEB-INF/jsp/lodgerInfo/registerEntry.jsp";
	}

	//{ps} ӳ���ַ: /LodgingInfo/saveRegisterEntry
	@RequestMapping("/saveRegisterEntry")
	protected String saveRegisterEntry(LodgingInfo lodInfo, HttpServletRequest req, 
			HttpServletResponse resp){
		//{ps} �������һ�������������; ..
		//{ps} ס�͵���Ϣ��û�� ?
		//{ps} ѡ��ʲô����, ס���(��ʼʱ��, ����ʱ��) ?
		String jsonText = lodInfo.getLodgerData();   //{ps} ס�͵� json ��Ϣ
		JSONArray arr = JSON.parseArray( jsonText );  //���� Json ��������
		List<Lodger> list = new ArrayList();
		for (int i=0; i<arr.size(); i++) {
			//{ԭʼ�ı�} {"phone":"","sex":"a3","certificate":"1","lodgerName":"a1","certificateNo":"a2","isRegister":"0"}
			//����һ���ı� ת��һ������..
			//{ps} arr.getObject(�±�,Bean�ֽ���);
			Lodger lodger = arr.getObject(i, Lodger.class);
			list.add( lodger );   //{ps} ���浽  list ����
			if( lodger.getIsRegister().equals("1") ){
				//{ps} �Ǽ��˵�����
				lodInfo.setRegisterName( lodger.getLodgerName() );
			}
		}
		//{ps} ���� Service ���������������ݿ�
		LodgingInfo lodgingInfo = lodInfoService.saveLodgingInfo(lodInfo, list);
		HttpSession session = req.getSession( false );
		session.setAttribute("lodgingInfo", lodgingInfo);   //{ps} ���õ��Ự�� ..
		//��ʱ ��  "viewLodgingInfoList" ������ȡ��
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
			session.removeAttribute("lodgingInfo");  //{ps} �ӻỰ������������� ..
		}else{
			//{ps} �����ݿ��õ����е��嵥 ..
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
		//Page ��Ҫ���ã�����ҳ��   ���չؼ���  
		Page<Room> svPage = roomService.getStateList(page);
//		Page<Room> svPage = roomService.getRoomList(page);
		//�������õ�������չʾ��jspҳ
		req.setAttribute("svPage", svPage);
		
		//�ڲ�ת����/WEB-INF/jsp/room/roomList.jsp;
		return "forward:/WEB-INF/jsp/lodgerInfo/stateList.jsp";
	}
	
	
	@RequestMapping("/viewStateChange")
	protected String viewStateChange(Page page ,HttpServletRequest req ,HttpServletResponse resp){
		//Page ��Ҫ���ã�����ҳ��   ���չؼ���  
		Page<Room> svPage = roomService.getRoomList(page);
		//�������õ�������չʾ��jspҳ
		req.setAttribute("svPage", svPage);
		
		//�ڲ�ת����/WEB-INF/jsp/room/roomList.jsp;
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

//iTrace.print( lodInfo.getDeposit()    );   //{ps} ���˶���Ѻ��
//iTrace.print( lodInfo.getEntryDate()  );   //��סʱ��
//iTrace.print( lodInfo.getLeaveDate()  );   //���ʱ��
//iTrace.print( lodInfo.getOperatorId() );   //˭���ĵ�

