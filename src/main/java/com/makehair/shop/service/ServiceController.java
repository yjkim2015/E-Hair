package com.makehair.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.makehair.shop.commom.util.CommonController;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ResultVo;
import com.makehair.shop.common.constants.ServiceVo;

@Controller
public class ServiceController extends CommonController{

	@Autowired
	private ServiceDao serviceDao;
	
	@RequestMapping(value="/serviceView", method = RequestMethod.GET)
	public String serviceView(CommonUserVo commonUserVo) {
		return "/service/serviceView";
	}
	
	@RequestMapping(value="/insertService", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<ResultVo> insertService(@RequestBody ServiceVo serviceVo) {
		System.out.println(serviceVo.toString());
		ResultVo resultVo = null;
		try {
			if ( serviceDao.checkService(serviceVo) > 0 ) {
				throw new Exception();
			}
			else {
				int result = serviceDao.insertService(serviceVo);
				
				if ( result > 0 ) {
					resultVo = new ResultVo(result, HttpStatus.OK);
				}
				else {
					throw new Exception();
				}
			}
		}
		catch(Exception ex) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
			resultVo.setReason("이미 등록된 서비스 입니다");
		}
		
		return resultVo.build();
	}
}
