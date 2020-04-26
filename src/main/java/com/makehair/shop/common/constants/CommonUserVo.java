package com.makehair.shop.common.constants;

import java.util.Date;
/*
  Designer와 일반 user 공통 vo
 * */
public class CommonUserVo {
	
	private String userId;
	private String password;
	private String name;
	private String sex;
	private String phone;
	private int age;
	private Date insertDate;
	private Date deleteDate;
	private int shopNo;
	
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
	
}

