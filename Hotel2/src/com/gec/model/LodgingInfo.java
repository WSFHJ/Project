package com.gec.model;

public class LodgingInfo {

	private int id;      //入住日期
	
	private String entryDate;  //入住日期
	private String leaveDate;  //离店日期
	private String roomId;   //房间 ID (如: 302)
	private int deposit;     //押金 (如: 250)
	private String lodgerData; //所有宾客的信息( json 数组)
	
	private String registerName;
	private String reservationId;
	
	public String getRegisterName() { return registerName; }
	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

	private String operatorId;        //操作者ID (前台)
	
	public String getReservationId() { return reservationId; }
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}

	public int getId() { return id; }
	public void setId(int id) {
		this.id = id;
	}

	private int days;          //入住天数
	
	public String getEntryDate() { return entryDate; }
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getLeaveDate() { return leaveDate; }
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getRoomId() { return roomId; }
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public int getDeposit() { return deposit; }
	public void setDeposit(int deposit) { this.deposit = deposit; }
	
	public String getLodgerData() { return lodgerData; }
	public void setLodgerData(String lodgerData) {
		this.lodgerData = lodgerData;
	}

	public String getOperatorId() { return operatorId; }
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	public int getDays() { return days; }
	public void setDays(int days) { this.days = days; }
	
	@Override
	public String toString() {
		return "LodgingInfo [entryDate=" + entryDate + ", leaveDate=" + 
				leaveDate + ", roomId=" + roomId + ", deposit="
				+ deposit + ", operatorId=" + operatorId + ", id=" + id 
				+", days=" + days + "]";
	}
	
	
}
