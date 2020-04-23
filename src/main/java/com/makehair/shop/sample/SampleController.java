package com.makehair.shop.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.makehair.shop.common.constants.CommonUserVo;

@Controller
public class SampleController {
	
	@Autowired
	private SampleService sampleService;
	
	
	@RequestMapping(value="/")
	public String hell() {
		
		CommonUserVo userVo = new CommonUserVo();
		userVo.setUserId("yjk");
		userVo.setName("yjkim");
		
		sampleService.insertUser(userVo);
		
		
		return "main";
	}
	
}

