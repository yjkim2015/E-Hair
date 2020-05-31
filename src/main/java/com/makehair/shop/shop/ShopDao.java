package com.makehair.shop.shop;

import com.makehair.shop.common.constants.CommonUserVo;
import org.springframework.stereotype.Repository;


@Repository
public interface ShopDao {

	int insertShop(CommonUserVo userVo);
}
