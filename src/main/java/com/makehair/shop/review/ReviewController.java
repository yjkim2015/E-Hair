package com.makehair.shop.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.makehair.shop.commom.util.CommonController;
import com.makehair.shop.common.constants.EvaluateVo;
import com.makehair.shop.common.constants.ResultVo;

@Controller
public class ReviewController extends CommonController {
	@Autowired
	private ReviewService reviewService;
	
	@ResponseBody
	@RequestMapping(value="/evaluate/star", method = RequestMethod.POST)
	public ResponseEntity<ResultVo> evaluate(@RequestBody EvaluateVo evaluateVo) {
		
		ResultVo resultVo = null;
		int result = 0;
		try {
			result = reviewService.checkEvaluateStar(evaluateVo);
			resultVo = new ResultVo(result, HttpStatus.OK);

			if (result == 0) {
				reviewService.evaluateStar(evaluateVo);
			}
			else {
				resultVo.setReason("이미 별점을 등록하셨습니다");
			}

		}
		catch(Exception ex) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo.build();
	}
}
