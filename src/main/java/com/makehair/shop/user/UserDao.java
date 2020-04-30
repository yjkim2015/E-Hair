package com.makehair.shop.user;

import com.makehair.shop.common.constants.UserVo;
import org.springframework.stereotype.Repository;


@Repository
public interface UserDao {

	int insertUser(final UserVo userVo);

}
