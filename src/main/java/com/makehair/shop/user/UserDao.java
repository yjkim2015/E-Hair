package com.makehair.shop.user;

import com.makehair.shop.common.constants.CommonUserVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface UserDao {

    int insertUser(final CommonUserVo userVo);

    int checkId(@Param("map") Map<String, Object> map);

    CommonUserVo loginUser(CommonUserVo commonUserVo);

    CommonUserVo loginAdmin(CommonUserVo commonUserVo);

    int insertAdmin(CommonUserVo userVo);

    CommonUserVo getUserInfo(int userNo);

    CommonUserVo checkAdmin(@Param("map") Map<String, Object> map);

    int updateUser(CommonUserVo commonUserVo);

    int deleteUser(CommonUserVo userVo);

}