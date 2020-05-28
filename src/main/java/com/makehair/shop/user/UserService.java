package com.makehair.shop.user;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.shop.ShopDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {

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
        System.out.println(userDao.checkId(map));
        return userDao.checkId(map) == 1;
    }


    public CommonUserVo login(String userType, CommonUserVo commonUserVo) {
        CommonUserVo userVo;

        if (userType.equals("admin")) {
            userVo = userDao.loginAdmin(commonUserVo);
        } else {
            userVo = userDao.loginUser(commonUserVo);
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

    public Boolean checkAdmin(int adminNo, String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("adminId", userId);
        map.put("adminNo", adminNo);

        if(userDao.checkAdmin(map) == null) {
            return false;
        }
        return true;
    }

    public CommonUserVo updateUser(CommonUserVo commonUserVo) {
        userDao.updateUser(commonUserVo);
        return userDao.getUserInfo(commonUserVo.getUserNo());
    }

    public Boolean deleteUser(CommonUserVo userVo) {
        return userDao.deleteUser(userVo) == 1;
    }
}
