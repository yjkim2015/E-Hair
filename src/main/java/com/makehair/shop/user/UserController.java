package com.makehair.shop.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.makehair.shop.common.constants.CommonUserVo;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

  private UserService userService;

  @Autowired
  public UserController(UserService userService) {
    this.userService = userService;
  }


  @RequestMapping(value = "/join", method = RequestMethod.GET)
  public String joinForm() {
    return "login/join";
  }

  @RequestMapping(value = "/join", method = RequestMethod.POST)
  public String join(@ModelAttribute CommonUserVo userVo) {
    System.out.println(userVo);
    userService.inserUser(userVo);

    return "login/login";
  }

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String loginForm(@RequestParam(value = "loginType", defaultValue = "user") String loginType) {
    // user or admin 으로 파라미터를 받아서 로그인 다르게 요청
    System.out.println(loginType);


    return "login/login";
  }

  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String loginProcess(@RequestParam(value = "loginType", defaultValue = "user") String loginType) {
    // user or admin 으로 파라미터를 받아서 로그인 다르게 요청
    System.out.println(loginType);

    return "main/main";
  }
}
