package com.makehair.shop.admin;

import com.makehair.shop.common.constants.SalesVo;
import com.makehair.shop.common.constants.UserDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AdminDao {

    int insertSales(SalesVo salesVo);

    int insertMemo(UserDetail userDetail);

    int getMemoCount(@Param("map") Map<String, Object> map);

    List<UserDetail> getMemoList(@Param("map") Map<String, Object> map);
}
