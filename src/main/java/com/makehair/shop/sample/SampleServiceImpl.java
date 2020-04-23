package com.makehair.shop.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.UserVo;

@Service
public class SampleServiceImpl implements SampleService {

	@Autowired
	private SampleDao sampleDao;
	
	@Override
	public int insertUser(UserVo userVo) {
		
		return sampleDao.insertUser(userVo);
	}

}
