package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.shop.ShopDao;
import com.makehair.shop.user.UserDao;
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

  public int inserUser(CommonUserVo userVo) {
    return userDao.insertUser(userVo);
  }


  public Boolean checkId(String id, String userType) {
    Map<String, Object> map = new HashMap<>();
    map.put("id", id);
    map.put("userType", userType);

    return userDao.checkId(map) == 1;
  }


  public CommonUserVo login(String userType, CommonUserVo commonUserVo) {
    CommonUserVo userVo;

    if (userType.equals("admin")) {
			userVo = userDao.loginUser(commonUserVo);
    } else {
      userVo = userDao.loginAdmin(commonUserVo);
    }

    return userVo;
  }


  public int inserAdmin(CommonUserVo userVo) {
    int result = shopDao.insertShop(userVo.getShopName());
    int shopNo = shopDao.getLastId();
    System.out.println(userVo);
    userVo.setShopNo(shopNo);

    return userDao.insertAdmin(userVo);
  }
}
