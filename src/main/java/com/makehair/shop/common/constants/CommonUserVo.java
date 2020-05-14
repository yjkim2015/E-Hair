package com.makehair.shop.common.constants;

import java.util.Arrays;
import java.util.Date;
/*
  Designer와 일반 user 공통 vo
 * */
public class CommonUserVo {
	
	private int userNo;
	private int adminNo;
	private String userId;
	private String password;
	private String name;
	private String sex;
	private String phone;
	private int age;
	private Date insertDate;
	private Date deleteDate;
	private String profile;
	private String imgUrl;
	
	private String[] files;
	private int shopNo;
	private String shopName;
	private int starPoint;
	public int getUserNo() {
		return userNo;
	}
	
	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getInsertDate() {
		return insertDate;
	}
	
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	public Date getDeleteDate() {
		return deleteDate;
	}
	
	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

	@Override
	public String toString() {
		return "CommonUserVo [userNo=" + userNo + ", adminNo=" + adminNo + ", userId=" + userId + ", password="
				+ password + ", name=" + name + ", sex=" + sex + ", phone=" + phone + ", age=" + age + ", insertDate="
				+ insertDate + ", deleteDate=" + deleteDate + ", profile=" + profile + ", imgUrl=" + imgUrl + ", files="
				+ Arrays.toString(files) + ", shopNo=" + shopNo + ", shopName=" + shopName + ", starPoint=" + starPoint
				+ "]";
	}
	
	

}

