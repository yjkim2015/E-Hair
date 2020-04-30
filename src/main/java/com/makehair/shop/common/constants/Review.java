package com.makehair.shop.common.constants;


public class Review {

  private long reviewNo;
  private String reviewTitle;
  private String reviewContent;
  private long stars;
  private java.sql.Timestamp insertDate;
  private long serviceNo;
  private String userId;
  private String adminId;


  public long getReviewNo() {
    return reviewNo;
  }

  public void setReviewNo(long reviewNo) {
    this.reviewNo = reviewNo;
  }


  public String getReviewTitle() {
    return reviewTitle;
  }

  public void setReviewTitle(String reviewTitle) {
    this.reviewTitle = reviewTitle;
  }


  public String getReviewContent() {
    return reviewContent;
  }

  public void setReviewContent(String reviewContent) {
    this.reviewContent = reviewContent;
  }


  public long getStars() {
    return stars;
  }

  public void setStars(long stars) {
    this.stars = stars;
  }


  public java.sql.Timestamp getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(java.sql.Timestamp insertDate) {
    this.insertDate = insertDate;
  }


  public long getServiceNo() {
    return serviceNo;
  }

  public void setServiceNo(long serviceNo) {
    this.serviceNo = serviceNo;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getAdminId() {
    return adminId;
  }

  public void setAdminId(String adminId) {
    this.adminId = adminId;
  }

}
