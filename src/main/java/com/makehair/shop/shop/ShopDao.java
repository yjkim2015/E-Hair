package com.makehair.shop.shop;

import org.springframework.stereotype.Repository;


@Repository
public interface ShopDao {

	int insertShop(String shopName);

	int getLastId();
}
