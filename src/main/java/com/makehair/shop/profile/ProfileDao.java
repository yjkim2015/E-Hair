package com.makehair.shop.profile;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.CommonUserVo;

@Repository
public interface ProfileDao {

	public CommonUserVo selectProfile(final CommonUserVo adminVo);
	
}
