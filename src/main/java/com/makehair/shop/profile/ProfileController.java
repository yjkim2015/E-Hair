package com.makehair.shop.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.makehair.shop.common.constants.CommonUserVo;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	public String profileView(Model model, @RequestParam CommonUserVo adminVo) {
		
		model.addAttribute("oneProfile", profileService.selectProfile(adminVo));
		return "profile/profileView";
	}
	
	/*
	 * @RequestMapping(value="/profile", method = RequestMethod.POST) public String
	 * updateProfile(Model model, @RequestParam CommonUserVo adminVo) {
	 * 
	 * model.addAttribute("oneProfile", profileService.selectProfile(adminVo));
	 * return "profile/profileView"; }
	 */
	
}
