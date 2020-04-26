package com.makehair.shop.common.constants;

import java.util.Date;

public class ReservationVo {
	
	private int reservationNo;
	private Date reservationDate;
	private Boolean isConfirm;
	private String memo;
	private Date insertDate;
	private int serviceNo;
	private int adminNo;
	private String userId;
	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
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
	@Override
	public String toString() {
		return "ReservationVo [reservationNo=" + reservationNo + ", reservationDate=" + reservationDate + ", isConfirm="
				+ isConfirm + ", memo=" + memo + ", insertDate=" + insertDate + ", serviceNo=" + serviceNo
				+ ", adminNo=" + adminNo + ", userId=" + userId + "]";
	}
	
}
