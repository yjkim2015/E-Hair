package com.makehair.shop.common.constants;


public class DayOffVo {

  private String dayOff;
  private java.sql.Timestamp dayOffDate;
  private java.sql.Timestamp insertDate;
  private String adminNo;


  public String getDayOff() {
    return dayOff;
  }

  public void setDayOff(String dayOff) {
    this.dayOff = dayOff;
  }


  public java.sql.Timestamp getDayOffDate() {
    return dayOffDate;
  }

  public void setDayOffDate(java.sql.Timestamp dayOffDate) {
    this.dayOffDate = dayOffDate;
  }


  public java.sql.Timestamp getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(java.sql.Timestamp insertDate) {
    this.insertDate = insertDate;
  }

  public String getAdminNo() {
	return adminNo;
  }
	
  public void setAdminNo(String adminNo) {
	this.adminNo = adminNo;
  }



}
