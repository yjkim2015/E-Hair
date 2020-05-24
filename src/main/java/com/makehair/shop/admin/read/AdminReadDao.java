package com.makehair.shop.admin.read;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReviewVo;
import com.makehair.shop.common.constants.SalesVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface AdminReadDao {

    List<SalesVo> getSalesDayList(@Param("map") Map<String, Object> map);

    int getSalesDayCount(@Param("map") Map<String, Object> map);

    List<CommonUserVo> getUserList(@Param("map") Map<String, Object> map);

    int getUserCount(Map<String, Object> map);

    List<ReviewVo> getReviewList(@Param("map") Map<String, Object> map);

    int getReviewCount(Map<String, Object> map);
}
