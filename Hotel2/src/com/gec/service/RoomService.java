package com.gec.service;

import com.gec.dao.RoomDao;
import com.gec.model.Page;
import com.gec.model.Room;

public class RoomService {
	private RoomDao roomDao = new RoomDao();
	public Page<Room> getRoomList(Page page){
		return roomDao.getRoomList(page);
	}
	public int saveRoom(Room room) {
		// TODO Auto-generated method stub
		int i = roomDao.saveRoom(room);
		return i;
	}
	public int setStatus(Room room) {
		int i = roomDao.setStatus(room.getId(),room.getStatus());
		return i;
	}
	
	public Page<Room> getStateList(Page page) {
		return roomDao.getStateList(page);
	}

}
