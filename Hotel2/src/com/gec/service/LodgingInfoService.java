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
		//{ps} 做一个操作, insert 操作后, 把  id 拿到, 并且还要设置到  lodInfo 上面..
		lodInfo = lodInfoDao.saveLodgingInfo( lodInfo );
		lodInfoDao.saveLodgers( list, lodInfo.getId() );
		//{ps} 更新房间的状态为: 已入住
		//<option value="1">正在入住</option>
		//<option value="2">打扫中</option>
		//<option value="3">维修中</option>
		//<option value="4">空置状态(没有住)</option>
		roomDao.setStatus( lodInfo.getRoomId(), "1");  //{ps} 正在入住
		return lodInfo;
	}
	
	public List<LodgingInfo> saveLodgingInfo() {
		return lodInfoDao.getItem();
	}

}



