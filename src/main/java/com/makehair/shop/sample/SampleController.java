package com.makehair.shop.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.makehair.shop.common.constants.UserVo;

@Controller
public class SampleController {
	
	@Autowired
	private SampleService sampleService;
	
	
	@RequestMapping(value="/")
	public String hell() {
		
		UserVo userVo = new UserVo();
		userVo.setUserId("yjk");
		userVo.setUserName("yjkim");
		
		sampleService.insertUser(userVo);
		
		return "main";
	}
	
	
	
}

