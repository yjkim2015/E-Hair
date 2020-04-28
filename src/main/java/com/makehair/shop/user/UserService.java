package com.makehair.shop.user;

import com.makehair.shop.common.constants.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public int inserUser(UserVo userVo) {
		return userDao.insertUser(userVo);
	}
}
