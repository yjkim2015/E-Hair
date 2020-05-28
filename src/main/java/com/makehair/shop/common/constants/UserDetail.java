package com.makehair.shop.common.constants;


import java.util.Date;

public class UserDetail {

  private long userDetailNo;
  private String memo;
  private long count;
  private Date insertDate;
  private int userNo;


  public long getUserDetailNo() {
    return userDetailNo;
  }

  public void setUserDetailNo(long userDetailNo) {
    this.userDetailNo = userDetailNo;
  }


  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }


  public long getCount() {
    return count;
  }

  public void setCount(long count) {
    this.count = count;
  }

  public Date getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(Date insertDate) {
    this.insertDate = insertDate;
  }

  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }
}
