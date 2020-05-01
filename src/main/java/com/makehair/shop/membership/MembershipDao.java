package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import org.springframework.stereotype.Repository;


@Repository
public interface MembershipDao {

	int insertUser(final CommonUserVo userVo);

  int checkId(String id);

  CommonUserVo loginUser(CommonUserVo commonUserVo);

  CommonUserVo loginAdmin(CommonUserVo commonUserVo);

  int insertAdmin(CommonUserVo userVo);
}
