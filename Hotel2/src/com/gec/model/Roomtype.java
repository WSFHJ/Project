package com.gec.model;

public class Roomtype{
	private String typeName;
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	private String dayPrice;
	private String hourPrice;
//	private String updateData;
//	private String createDate;
	public String getDayPrice() {
		return dayPrice;
	}
	public void setDayPrice(String dayPrice) {
		this.dayPrice = dayPrice;
	}
	public String getHourPrice() {
		return hourPrice;
	}
	public void setHourPrice(String hourPrice) {
		this.hourPrice = hourPrice;
	}
	
	@Override
	public String toString() {
		return "Roomtype [typeName=" + typeName + ", dayPrice=" + dayPrice + ", hourPrice=" + hourPrice + "]";
	}


}
