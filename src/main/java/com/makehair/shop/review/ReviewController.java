package com.makehair.shop.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.makehair.shop.commom.util.CommonController;
import com.makehair.shop.common.constants.Criteria;
import com.makehair.shop.common.constants.EvaluateVo;
import com.makehair.shop.common.constants.PageMaker;
import com.makehair.shop.common.constants.ResultVo;
import com.makehair.shop.common.constants.ReviewVo;

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
	
	@ResponseBody
	@RequestMapping(value="/replies", method = RequestMethod.POST)
	public ResponseEntity<ResultVo> register(@RequestBody ReviewVo reviewVo) {
		ResultVo resultVo = null;
		System.out.println("reviewVo : " + reviewVo);
		try {
			int result = reviewService.create(reviewVo);
			resultVo = new ResultVo(result, HttpStatus.OK);
		}
		catch(Exception ex) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo.build();
	}
	
	@ResponseBody
	@RequestMapping(value="/replies/{adminNo}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list (@PathVariable("adminNo") Integer adminNo, 
			@PathVariable("page") Integer page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String,Object>();
			System.out.println("adminNo : " +adminNo);
			System.out.println("page :" +page);
			List<ReviewVo> list = reviewService.list(adminNo, cri);
			
			System.out.println("list : :" +list);
			map.put("list",list);
			
			int replyCount = reviewService.count(adminNo);
			System.out.println("replyCount : " + replyCount);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		catch(Exception ex) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/replies/{reviewNo}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reviewNo") Integer reviewNo, @RequestBody ReviewVo reviewVo ) {
		
		ResponseEntity<String> entity = null;
		
		try {
			reviewVo.setReviewNo(reviewNo);
			reviewService.update(reviewVo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch(Exception ex) {
			
			entity = new ResponseEntity<String>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/replies/{reviewNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reviewNo") Integer reviewNo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			reviewService.delete(reviewNo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch(Exception ex) {
			entity = new ResponseEntity<>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
