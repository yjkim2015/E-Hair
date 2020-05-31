package com.makehair.shop.membership;

import com.makehair.shop.common.constants.Auth;
import com.makehair.shop.common.constants.Auth.Role;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.Membership;
import com.makehair.shop.common.constants.MembershipUsage;
import com.makehair.shop.user.UserService;
import java.lang.reflect.Member;
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

  @Autowired
  private MembershipService membershipService;

  @Autowired
  private UserService userService;


  @Autowired
  public MembershipController(MembershipService membershipService) {
    this.membershipService = membershipService;
  }


  // 포인트 관리 페이지 -> 각 회원별 list
  @RequestMapping(value = "", method = RequestMethod.GET)
  @Auth(role = Role.USER)
  public String getList(Model model, HttpSession httpSession) {

    CommonUserVo commonUserVo = (CommonUserVo) httpSession.getAttribute("loginUser");

    Membership membership = membershipService.getMembership(commonUserVo.getUserNo());


    if(commonUserVo.getUserNo() == 0) {
      return "redirect:/";
    }

    List<MembershipUsage> membershipUsageList = membershipService.getList((int)membership.getMembershipNo());
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


  @RequestMapping(value = "/charge", method = RequestMethod.GET)
  public String membershipCharge(@RequestParam(value = "userNo", defaultValue = "0") Integer userNo,
      Model model) {

    if(userNo == 0) {
      return "redirect:/";
    }

    Membership membership = membershipService.getMembership(userNo);
    long point = membershipService.getMembershipPoint(membership.getMembershipNo());

    model.addAttribute("point", point);

    return "membership/membershipCharge";
  }


  @RequestMapping(value = "/charge", method = RequestMethod.POST)
  @Auth
  public String membershipCharge(@RequestParam(value = "userNo", defaultValue = "0") Integer userNo,
      MembershipUsage membershipUsage, Model model) {

    Membership membership = membershipService.getMembership(userNo);
    membershipUsage.setMembershipNo((int) membership.getMembershipNo());
    membershipService.addMembershipUsage(membershipUsage);

    return "redirect:/membership?userNo"+userNo;
  }

}
