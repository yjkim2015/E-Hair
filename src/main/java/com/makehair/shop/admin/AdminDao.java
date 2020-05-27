package com.makehair.shop.admin;

import com.makehair.shop.common.constants.SalesVo;
import com.makehair.shop.common.constants.UserDetail;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {


    int insertSales(SalesVo salesVo);

    int insertMemo(UserDetail userDetail);
}
