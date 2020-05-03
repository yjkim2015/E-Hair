package com.makehair.shop.review;

import java.util.List;

import com.makehair.shop.common.constants.Criteria;
import com.makehair.shop.common.constants.EvaluateVo;
import com.makehair.shop.common.constants.ReviewVo;

public interface ReviewService {
	
	public int checkEvaluateStar(EvaluateVo evaluateVo);
	
	public int evaluateStar(EvaluateVo evaluateVo);
	
	public List<ReviewVo> list(Integer adminNo, Criteria cri);
	
	public int count(Integer adminNo);
	
	public int create(ReviewVo reviewVo);
	
	public int update(ReviewVo reviewVo);
	
	public int delete(Integer reviewNo);
	
}
