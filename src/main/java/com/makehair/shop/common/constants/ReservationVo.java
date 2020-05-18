package com.makehair.shop.common.constants;

import java.util.Date;

public class ReservationVo {
	
	private int reservationNo;
	private String reservationDate;
	private Boolean isConfirm;
	private String memo;
	private Date insertDate;
	private int serviceNo;
	private int adminNo;
	private String userId;
	private String serviceName;
	private int servicePrice;
	private int userNo;
	private String userName;
	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public Boolean getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(Boolean isConfirm) {
		this.isConfirm = isConfirm;
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
	public int getServiceNo() {
		return serviceNo;
	}
	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}
	
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
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public int getServicePrice() {
		return servicePrice;
	}
	public void setServicePrice(int servicePrice) {
		this.servicePrice = servicePrice;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "ReservationVo [reservationNo=" + reservationNo + ", reservationDate=" + reservationDate + ", isConfirm="
				+ isConfirm + ", memo=" + memo + ", insertDate=" + insertDate + ", serviceNo=" + serviceNo
				+ ", adminNo=" + adminNo + ", userId=" + userId + ", serviceName=" + serviceName + ", servicePrice="
				+ servicePrice + ", userNo=" + userNo + ", userName=" + userName + "]";
	}
	
}
