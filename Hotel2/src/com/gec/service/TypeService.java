package com.gec.service;

import com.gec.dao.TypeDao;
import com.gec.model.Page;
import com.gec.model.Roomtype;

public class TypeService {
	private TypeDao typeDao = new TypeDao();

	public Page<Roomtype> getRoomList(Page page) {
		return typeDao.getTypeList(page);
	}
	
	public int saveType(Roomtype roomtype){
		int i = typeDao.saveRoom(roomtype);
		return i;
	}

}
