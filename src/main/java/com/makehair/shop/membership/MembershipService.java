package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.MembershipUsage;
import com.makehair.shop.shop.ShopDao;
import com.makehair.shop.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MembershipService {

  @Autowired
  private MembershipDao membershipDao;

  public List<MembershipUsage> getList(int userNo) {
    return membershipDao.getPointListByUserNo(userNo);
  }

  public boolean getRefund(int userNo, long leftPoint) {
    Map<String, Object> map = new HashMap<>();
    map.put("userNo", userNo);
    map.put("leftPoint", -leftPoint);
    map.put("description", "환불");
    return membershipDao.getRefundByUserNo(map) == 1;
  }
}
