package com.makehair.shop.admin;

import com.makehair.shop.common.constants.SalesVo;
import com.makehair.shop.common.constants.UserDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    // 매출 등록
    public Boolean insertSales(SalesVo salesVo) {
        return adminDao.insertSales(salesVo) == 1;
    }

    // 메모 등록
    public Boolean insertMemo(UserDetail userDetail) {
        return adminDao.insertMemo(userDetail) == 1;
    }

}
