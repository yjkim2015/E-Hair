package com.makehair.shop.user;

import com.makehair.shop.common.constants.CommonUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
    public String join(
            @RequestParam(value = "userType", defaultValue = "user") String userType,
            @ModelAttribute CommonUserVo userVo) {

        if (userType.equals("admin")) {
            userService.inserAdmin(userVo);
        } else {
            userService.inserUser(userVo);
        }

        return "login/login";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(
            @RequestParam(value = "userType", defaultValue = "user") String userType) {

        return "login/login";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginProcess(
            @RequestParam(value = "userType", defaultValue = "user") String userType,
            @ModelAttribute CommonUserVo commonUserVo,
            HttpServletRequest request,
            Model model) {

        HttpSession session = request.getSession();
        // user or admin 으로 파라미터를 받아서 로그인 다르게 요청
        CommonUserVo result = userService.login(userType, commonUserVo);
        if (result == null) {
            // 로그인 실패
            model.addAttribute("result", "fail");
            return "login/login";
        } else {
            // 로그인 성공
            session.setAttribute("loginUser", result);
            return "redirect:/";
        }
    }


    @RequestMapping(value = "/check-id", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Boolean> checkId(@RequestParam("id") String id) {
        System.out.println(id);
        Boolean result = userService.checkId(id);

        Map<String, Boolean> map = new HashMap<>();
        map.put("checkId", result);
        System.out.println(map);

        return map;
    }


    @RequestMapping(value = "/user_detail", method = RequestMethod.GET)
    public String userDetail(@ModelAttribute CommonUserVo commonUserVo,
                             HttpSession httpSession,
                             Model model) {

        return "login/user_detail";
    }

    @RequestMapping(value = "/user_update", method = RequestMethod.POST)
    public String userUpdate(@ModelAttribute CommonUserVo commonUserVo, Model model) {
        userService.updateUser(commonUserVo);

        return "login/user_detail";
    }
}
