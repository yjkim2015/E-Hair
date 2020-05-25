package com.makehair.shop.admin.read;

import com.makehair.shop.common.constants.Auth;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReadVo;
import com.makehair.shop.common.constants.SalesVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
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
    @RequestMapping("")
    @ResponseBody
    public ResponseEntity<Map> getDataList(ReadVo readVo) {
        Map<String, Object> map = adminReadService.getDataList(readVo);
        return ResponseEntity.status(HttpStatus.OK).body(map);
    }
}
