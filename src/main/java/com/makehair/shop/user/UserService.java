package com.makehair.shop.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.CommonUserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public int inserUser(CommonUserVo userVo) {
		return userDao.insertUser(userVo);
	}
}
