package com.makehair.shop.user;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.CommonUserVo;


@Repository
public interface UserDao {

	int insertUser(final CommonUserVo userVo);

}
