package com.makehair.shop.service;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.ServiceVo;

@Repository
public interface ServiceDao {

    public int checkService(ServiceVo serviceVo);

    public int insertService(ServiceVo serviceVo);

    int delete(Integer serviceNo);
}
