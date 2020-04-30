package com.makehair.shop.common.constants;


public class UserDetail {

  private long userDetailNo;
  private String memo;
  private long count;
  private java.sql.Timestamp insertDate;
  private String userId;


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


  public java.sql.Timestamp getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(java.sql.Timestamp insertDate) {
    this.insertDate = insertDate;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

}
