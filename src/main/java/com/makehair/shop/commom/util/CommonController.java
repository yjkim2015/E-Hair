package com.makehair.shop.commom.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;

public class CommonController {
	
	@ModelAttribute("getContextPath")
	public String getContextPath(final HttpServletRequest request ) {
		return request.getContextPath();
	}
}
