package com.makehair.shop.profile;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.SearchCriteria;

@Repository
public interface ProfileDao {

	public List<CommonUserVo> selectAllProfile(SearchCriteria cri);
	
	public CommonUserVo selectProfile(final CommonUserVo adminVo);
	
	public int updateProfile(final CommonUserVo adminVo);
	
}
