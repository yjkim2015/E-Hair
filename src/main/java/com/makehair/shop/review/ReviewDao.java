package com.makehair.shop.review;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.EvaluateVo;

@Repository
public interface ReviewDao {
	
	public int checkEvaluateStar(EvaluateVo evaluateVo);
	
	public int evaluateStar(EvaluateVo evaluateVo);
}
