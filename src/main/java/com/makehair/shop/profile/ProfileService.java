package com.makehair.shop.profile;

import com.makehair.shop.common.constants.CommonUserVo;

public interface ProfileService {
	
	public CommonUserVo selectProfile(final CommonUserVo adminVo);
}
