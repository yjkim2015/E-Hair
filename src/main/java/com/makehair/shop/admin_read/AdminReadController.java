package com.makehair.shop.admin_read;

import com.makehair.shop.admin_read.AdminReadService;
import com.makehair.shop.common.constants.Auth;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReadVo;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

// admin read
@RequestMapping("/admin/read")
@Controller
public class AdminReadController {

    private AdminReadService adminReadService;

    @Autowired
    public AdminReadController(AdminReadService adminReadService) {
        this.adminReadService = adminReadService;
    }

    // 데이터 조회
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = {"", "/"})
    @ResponseBody
    public ResponseEntity<Map> getDataList(ReadVo readVo) {
        Map<String, Object> map = adminReadService.getDataList(readVo);
        return ResponseEntity.status(HttpStatus.OK).body(map);
    }


    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = {"/user-all"}, method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<CommonUserVo>> getUserListAll() {
        return ResponseEntity.status(HttpStatus.OK).body(adminReadService.getUserListAll());
    }


    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = {"/monthly"}, method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Map<String,Object>> monthlyReport(HttpSession httpSession) {
        CommonUserVo commonUserVo = (CommonUserVo) httpSession.getAttribute("loginUser");

        return ResponseEntity.status(HttpStatus.OK).body(adminReadService.getMonthlySalesReport(commonUserVo.getShopNo()));
    }
}
