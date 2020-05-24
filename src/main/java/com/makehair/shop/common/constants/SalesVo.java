package com.makehair.shop.common.constants;


import java.util.Date;

public class SalesVo {

  private long salesNo;
  private int adminNo;
  private long income;
  private String memo;
  private Date insertDate;


  public long getSalesNo() {
    return salesNo;
  }

  public void setSalesNo(long salesNo) {
    this.salesNo = salesNo;
  }


  public int getAdminNo() {
    return adminNo;
  }

  public void setAdminNo(int adminNo) {
    this.adminNo = adminNo;
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


  public Date getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(Date insertDate) {
    this.insertDate = insertDate;
  }

}
