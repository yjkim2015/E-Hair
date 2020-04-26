package com.makehair.shop.common.constants;

public class ShopVo {
	
	private int shopNo;
	private String shopName;
	private String owner;
	
	public int getShopNo() {
		return shopNo;
	}
	
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	
	public String getShopName() {
		return shopName;
	}
	
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	@Override
	public String toString() {
		return "ShopVo [shopNo=" + shopNo + ", shopName=" + shopName + ", owner=" + owner + "]";
	}
}
