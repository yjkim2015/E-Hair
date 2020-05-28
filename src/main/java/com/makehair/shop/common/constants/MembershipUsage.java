package com.makehair.shop.common.constants;

import java.util.Date;

public class MembershipUsage {

  private long usageNo;
  private long price;
  private String description;
  private Date insertDate;
  private int userNo;


  public long getUsageNo() {
    return usageNo;
  }

  public void setUsageNo(long usageNo) {
    this.usageNo = usageNo;
  }


  public long getPrice() {
    return price;
  }

  public void setPrice(long price) {
    this.price = price;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }


  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }

  public Date getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(Date insertDate) {
    this.insertDate = insertDate;
  }
}
