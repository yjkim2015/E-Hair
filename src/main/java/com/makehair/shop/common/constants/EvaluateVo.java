package com.makehair.shop.common.constants;

public class EvaluateVo {
	
	private int adminNo;
	private String userId;
	private int starPoint;
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	@Override
	public String toString() {
		return "EvaluateVo [adminNo=" + adminNo + ", userId=" + userId + ", starPoint=" + starPoint + "]";
	}
	
}
