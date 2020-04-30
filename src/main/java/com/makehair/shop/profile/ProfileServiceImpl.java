package com.makehair.shop.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.CommonUserVo;


@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;
	
	@Override
	public CommonUserVo selectProfile(CommonUserVo adminVo) {
		return profileDao.selectProfile(adminVo);
	}
}
