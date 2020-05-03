package com.makehair.shop.review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.EvaluateVo;
import com.makehair.shop.common.constants.ReviewVo;

@Repository
public interface ReviewDao {
	
	public int checkEvaluateStar(EvaluateVo evaluateVo);
	
	public int evaluateStar(EvaluateVo evaluateVo);
	
	public List<ReviewVo> list(Map<String, Object> paramMap);
	 
	public int count(Integer adminNo);
	
	public int create(ReviewVo reviewVo);
	
	public int update(ReviewVo reviewVo);
	
	public int delete(Integer reviewNo);
}
