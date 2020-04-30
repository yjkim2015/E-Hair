package com.makehair.shop.common.constants;


public class Sales {

  private long salesNo;
  private String adminId;
  private long income;
  private String memo;
  private java.sql.Timestamp insertDate;


  public long getSalesNo() {
    return salesNo;
  }

  public void setSalesNo(long salesNo) {
    this.salesNo = salesNo;
  }


  public String getAdminId() {
    return adminId;
  }

  public void setAdminId(String adminId) {
    this.adminId = adminId;
  }


  public long getIncome() {
    return income;
  }

  public void setIncome(long income) {
    this.income = income;
  }


  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }


  public java.sql.Timestamp getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(java.sql.Timestamp insertDate) {
    this.insertDate = insertDate;
  }

}
