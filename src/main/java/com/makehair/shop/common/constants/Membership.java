package com.makehair.shop.common.constants;


public class Membership {

  private long membershipNo;
  private String memo;
  private java.sql.Timestamp insertDate;
  private String userId;


  public long getMembershipNo() {
    return membershipNo;
  }

  public void setMembershipNo(long membershipNo) {
    this.membershipNo = membershipNo;
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


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

}
