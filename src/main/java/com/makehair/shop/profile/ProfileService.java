package com.makehair.shop.profile;

import java.util.List;

import com.makehair.shop.common.constants.CommonUserVo;

public interface ProfileService {
	
	public List<CommonUserVo> selectAllProfile();
	
	public CommonUserVo selectProfile(final CommonUserVo adminVo);
	
	public int updateProfile(final CommonUserVo adminVo);
	
}
