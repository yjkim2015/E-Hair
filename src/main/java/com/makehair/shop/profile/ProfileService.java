package com.makehair.shop.profile;

import java.util.List;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.SearchCriteria;

public interface ProfileService {
	
	public List<CommonUserVo> selectAllProfile(SearchCriteria cri);
	
	public CommonUserVo selectProfile(final CommonUserVo adminVo);
	
	public int updateProfile(final CommonUserVo adminVo);
	
}
