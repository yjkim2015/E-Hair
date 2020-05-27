package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.MembershipUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/membership")
public class MembershipController {

  private MembershipService membershipService;

  @Autowired
  public MembershipController(MembershipService membershipService) {
    this.membershipService = membershipService;
  }


  // 포인트 관리 페이지 -> 각 회원별 list
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String getList(@RequestParam("userNo") Integer userNo,
                        Model model) {

    if(userNo == 0) {
      return "redirect:/";
    }

    List<MembershipUsage> membershipUsageList = membershipService.getList(userNo);
    model.addAttribute("membershipUsageList", membershipUsageList);

    return "membership/membership";
  }

  @RequestMapping(value = "/refund", method = RequestMethod.GET)
  public String refundProcess(@RequestParam(value = "userNo", defaultValue = "0") Integer userNo,
                              @RequestParam("leftPoint") long leftPoint,
                              Model model) {

    if(userNo == 0) {
      return "redirect:/";
    }
    boolean refundResult = membershipService.getRefund(userNo, leftPoint);
    model.addAttribute("refundResult", refundResult);

    return "redirect:/membership?refundResult=" + refundResult;

  }
}
