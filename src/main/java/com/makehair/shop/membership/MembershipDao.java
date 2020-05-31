package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.Membership;
import com.makehair.shop.common.constants.MembershipUsage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MembershipDao {

    public List<MembershipUsage> getPointListByMembershipNo(int userNo);

    int getRefundByUserNo(@Param("map") Map<String, Object> map);

    int addMembership(@Param("map") Map<String, Object> map);

    Membership getMembership(int userNo);

    long getMembershipPoint(long membershipNo);

    int addMembershipUsage(MembershipUsage membershipUsage);
}
