package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.Membership;
import com.makehair.shop.common.constants.MembershipUsage;
import com.makehair.shop.shop.ShopDao;
import com.makehair.shop.user.UserDao;
import java.lang.reflect.Member;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MembershipService {

  @Autowired
  private UserDao userDao;

  @Autowired
  private ShopDao shopDao;

  @Autowired
  private MembershipDao membershipDao;


  public List<MembershipUsage> getList(int userNo) {
    return membershipDao.getPointListByMembershipNo(userNo);
  }

  public boolean getRefund(int userNo, long leftPoint) {
    Membership membership = getMembership(userNo);
    Map<String, Object> map = new HashMap<>();
    map.put("membershipNo", membership.getMembershipNo());
    map.put("leftPoint", -leftPoint);
    map.put("description", "환불");
    return membershipDao.getRefundByUserNo(map) == 1;
  }

  public Membership getMembership(int userNo) {
    return membershipDao.getMembership(userNo);
  }

  public Integer getMembershipPoint(long membershipNo) {
    return membershipDao.getMembershipPoint(membershipNo);
  }

  public int addMembershipUsage(MembershipUsage membershipUsage) {
    membershipUsage.setDescription("충전");
    return membershipDao.addMembershipUsage(membershipUsage);
  }
}
