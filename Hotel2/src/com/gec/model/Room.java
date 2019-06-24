package com.gec.model;

public class Room {
	private String id;          //房间编号: 302, 303,..
	private int typeId;         //房间类型 ID
	private String typeName;    //房间类型名称
	private int floor;          //所属楼层
	private String status;      //房间状态
	
	private String updateDate;  //更新日期
	private String createDate;  //创建日期
	
	public String getId() { return id; }
	public void setId(String id) {
		this.id = id;
	}

	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "Room [id=" + id + ", typeId=" + typeId + ", typeName=" 
				+ typeName + ", floor=" + floor + ", status="
				+ status + ", updateDate=" + updateDate + 
				", createDate=" + createDate + "]";
	}

}
