package com.makehair.shop.admin;

import com.makehair.shop.admin.read.AdminReadService;
import com.makehair.shop.common.constants.Auth;
import com.makehair.shop.common.constants.SalesVo;
import com.makehair.shop.common.constants.UserDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

// admin basic
@RequestMapping("/admin")
@Controller
public class AdminController {

    private AdminReadService adminReadService;

    @Autowired
    private AdminService adminService;

    @Autowired
    public AdminController(AdminReadService adminReadService) {
        this.adminReadService = adminReadService;
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping("/{adminNo}")
    public String adminMain(@PathVariable("adminNo") int adminNo,
                            Model model) {

        // 관리자 메인 페이지 -> 금일 매출 list default
        Map<String, Object> map = adminReadService.getSalesDayList(adminNo);
        model.addAttribute("map", map);

        return "admin/main";
    }

    // 매출 폼
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add/sales", method = RequestMethod.GET)
    public String addSales() {

        return "admin/sales";
    }

    // 매출 등록
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add/sales", method = RequestMethod.POST)
    public ResponseEntity<Map> addSales(SalesVo salesVo) {

        boolean result = adminService.insertSales(salesVo);
        
        Map<String, Object> map = new HashMap<>();
        map.put("result", result);
        
        return ResponseEntity.status(HttpStatus.OK).body(map);
    }

    // 회원별 메모 폼
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add/memo", method = RequestMethod.GET)
    public String addMemo(@RequestParam(value = "userId") String userId,
                          Model model) {

        model.addAttribute("userId", userId);
        return "admin/memo";
    }
    
    // 회원별 메모 등록
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add/memo", method = RequestMethod.POST)
    public ResponseEntity<Map> addMemo(UserDetail userDetail) {

        boolean result = adminService.insertMemo(userDetail);

        Map<String, Object> map = new HashMap<>();
        map.put("result", result);

        return ResponseEntity.status(HttpStatus.OK).body(map);
    }
}
