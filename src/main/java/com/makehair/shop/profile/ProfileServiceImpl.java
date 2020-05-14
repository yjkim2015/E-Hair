package com.makehair.shop.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.SearchCriteria;


@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;
	
	@Override
	public CommonUserVo selectProfile(CommonUserVo adminVo) {
		return profileDao.selectProfile(adminVo);
	}

	@Override
	public int updateProfile(CommonUserVo adminVo) {
		return profileDao.updateProfile(adminVo);
	}

	@Override
	public List<CommonUserVo> selectAllProfile(SearchCriteria cri) {
		return profileDao.selectAllProfile(cri);
	}
}
