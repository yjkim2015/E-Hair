package com.makehair.shop.membership;

import com.makehair.shop.common.constants.CommonUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/membership")
public class MembershipController {

  private MembershipService membershipService;

  @Autowired
  public MembershipController(MembershipService membershipService) {
    this.membershipService = membershipService;
  }


  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String joinForm() {

    return "membership/membership";
  }
}
