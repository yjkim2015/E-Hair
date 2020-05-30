package com.makehair.shop.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.makehair.shop.common.constants.CommonUserVo;

@Controller
public class ServiceController {

	@RequestMapping(value="/serviceView", method = RequestMethod.GET)
	public String serviceView(CommonUserVo commonUserVo) {
		return "/service/serviceView";
	}
}
