package com.gec.model;

import java.util.Date;

/*
	+---------------+--------------+
	| Field         | Type         |
	+---------------+--------------+
	| id            | int(32)      |
	| lodgingInfoId | int(32)      |
	| certificate   | varchar(1)   |
	| certificateNo | varchar(32)  |
	| lodgerName    | varchar(32)  |
	| sex           | varchar(1)   |
	| isRegister    | varchar(1)   |
	| phone         | varchar(32)  |
	| note          | varchar(255) |
	| createDate    | timestamp    |
	+---------------+--------------+
*/
public class Lodger {
	private int id;
	private int lodgingInfoId;         //入住单的单号
	private String certificate;
	private String certificateNo;
	protected String lodgerName;
	private String sex;
	private String isRegister;         //是不是登记人
	private String phone;
	private String note;
	private Date createDate;
		
	LodgingInfo lodgingInfo;   //多对一的关系
	
	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	
	public int getLodgingInfoId() { return lodgingInfoId; }
	public void setLodgingInfoId(int lodgingInfoId) {
		this.lodgingInfoId = lodgingInfoId;
	}

	public LodgingInfo getLodgingInfo() { return lodgingInfo; }
	public void setLodgingInfo(LodgingInfo lodgingInfo) {
		this.lodgingInfo = lodgingInfo;
	}
	
	public String getCertificate() { return certificate; }
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	
	public String getCertificateNo() { return certificateNo; }
	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}

	public String getLodgerName() { return lodgerName; }
	public void setLodgerName(String lodgerName) {
		this.lodgerName = lodgerName;
	}

	public String getSex() { return sex; }
	public void setSex(String sex) { this.sex = sex; }
	
	public String getIsRegister() { return isRegister; }
	public void setIsRegister(String isRegister) {
		this.isRegister = isRegister;
	}
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }
	
	public Date getCreateDate() { return createDate; }
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getPrint() {
		return "Lodger[id="+ id +", certificate="+ certificate +
				", certificateNo="+ certificateNo +", lodgerName="+ lodgerName +
				", sex="+ sex +", isRegister="+ isRegister +", phone="+ phone +"]";
	}
	
	@Override
	public String toString() {
		return "Lodger [id=" + id + ", lodgingInfoId=" + lodgingInfoId + ", lodgingInfo=" + lodgingInfo
				+ ", certificate=" + certificate + ", certificateNo=" + certificateNo + ", lodgerName=" + lodgerName
				+ ", sex=" + sex + ", isRegister=" + isRegister + ", phone=" + phone + "]";
	}
	
}


