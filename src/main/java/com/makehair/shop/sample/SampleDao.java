package com.makehair.shop.sample;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.CommonUserVo;

@Repository
public interface SampleDao {
	
	int insertUser(final CommonUserVo userVo);

}
