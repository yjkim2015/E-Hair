package com.makehair.shop.common.constants;

public class UserVo {
	
	private String userId;
	private String userName;
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		return "UserVo [userId=" + userId + ", userName=" + userName + "]";
	}
	
}

