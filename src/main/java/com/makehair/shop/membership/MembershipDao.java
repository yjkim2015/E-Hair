package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.MembershipUsage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MembershipDao {

    public List<MembershipUsage> getPointListByUserNo(int userNo);

    int getRefundByUserNo(@Param("map") Map<String, Object> map);
}
