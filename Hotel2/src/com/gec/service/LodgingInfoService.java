package com.gec.service;

import java.util.List;

import com.gec.dao.LodgingInfoDao;
import com.gec.dao.RoomDao;
import com.gec.model.Lodger;
import com.gec.model.LodgingInfo;

public class LodgingInfoService {

	LodgingInfoDao lodInfoDao = new LodgingInfoDao();
	RoomDao roomDao = new RoomDao();
	
	public LodgingInfo saveLodgingInfo(LodgingInfo lodInfo, List<Lodger> list) {
		//{ps} ��һ������, insert ������, ��  id �õ�, ���һ�Ҫ���õ�  lodInfo ����..
		lodInfo = lodInfoDao.saveLodgingInfo( lodInfo );
		lodInfoDao.saveLodgers( list, lodInfo.getId() );
		//{ps} ���·����״̬Ϊ: ����ס
		//<option value="1">������ס</option>
		//<option value="2">��ɨ��</option>
		//<option value="3">ά����</option>
		//<option value="4">����״̬(û��ס)</option>
		roomDao.setStatus( lodInfo.getRoomId(), "1");  //{ps} ������ס
		return lodInfo;
	}
	
	public List<LodgingInfo> saveLodgingInfo() {
		return lodInfoDao.getItem();
	}

}



