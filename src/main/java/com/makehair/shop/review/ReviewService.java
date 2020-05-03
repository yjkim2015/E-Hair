package com.makehair.shop.review;

import com.makehair.shop.common.constants.EvaluateVo;

public interface ReviewService {
	
	public int checkEvaluateStar(EvaluateVo evaluateVo);
	
	public int evaluateStar(EvaluateVo evaluateVo);
	
}
