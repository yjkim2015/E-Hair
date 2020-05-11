package com.makehair.shop.common.constants;


public class ReviewVo {

  private long reviewNo;
  private String reviewTitle;
  private String reviewContent;
  private long stars;
  private String insertDate;
  private long serviceNo;
  private String userId;
  private int adminNo;


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


  public String getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(String insertDate) {
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

  public int getAdminNo() {
	return adminNo;
  }

  public void setAdminNo(int adminNo) {
	this.adminNo = adminNo;
  }

	@Override
	public String toString() {
		return "ReviewVo [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", stars=" + stars + ", insertDate=" + insertDate + ", serviceNo=" + serviceNo + ", userId=" + userId
				+ ", adminNo=" + adminNo + "]";
	}
	  
  
}
