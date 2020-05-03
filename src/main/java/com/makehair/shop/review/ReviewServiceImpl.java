package com.makehair.shop.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.EvaluateVo;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public int checkEvaluateStar(EvaluateVo evaluateVo) {
		int result =reviewDao.checkEvaluateStar(evaluateVo);
		return result;
	}

	@Override
	public int evaluateStar(EvaluateVo evaluateVo) {
		return reviewDao.evaluateStar(evaluateVo);
	}

}
