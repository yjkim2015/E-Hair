package com.makehair.shop.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.Criteria;
import com.makehair.shop.common.constants.EvaluateVo;
import com.makehair.shop.common.constants.ReviewVo;


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

	@Override
	public List<ReviewVo> list(Integer adminNo,Criteria cri) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("adminNo", adminNo);
		paramMap.put("cri", cri);
		
		return reviewDao.list(paramMap);
	}

	@Override
	public int create(ReviewVo reviewVo) {
		return reviewDao.create(reviewVo);
	}

	@Override
	public int update(ReviewVo reviewVo) {
		return reviewDao.update(reviewVo);
	}

	@Override
	public int delete(Integer reviewNo) {
		return reviewDao.delete(reviewNo);
	}

	@Override
	public int count(Integer adminNo) {
		return reviewDao.count(adminNo);
	}

}
