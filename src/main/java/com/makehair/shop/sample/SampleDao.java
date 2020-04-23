package com.makehair.shop.sample;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.UserVo;

@Repository
public interface SampleDao {
	
	public int insertUser(final UserVo userVo);

}
