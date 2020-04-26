package com.makehair.shop.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReservationVo;
import com.makehair.shop.common.constants.ResultVo;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/checkReservation", method = RequestMethod.GET)
	public String checkReservation(Model model, CommonUserVo commonUserVo) {
		model.addAttribute("list", reservationService.checkReservation(commonUserVo));
		return "reservation/checkReservation";
	}
	
	@RequestMapping(value="/insertReservation", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<ResultVo> insertReservation(@RequestBody ReservationVo reservationVo) {
		
		ResultVo resultVo = null;
		try {
			final int result = reservationService.insertReservation(reservationVo);
			resultVo = new ResultVo(result, HttpStatus.OK);
		}
		catch (Exception e) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
			resultVo.setReason("예약에 실패 하였습니다.");
		}
		return resultVo.build();
	}
	
	@RequestMapping(value="/deleteReservation", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<ResultVo> deleteReservation(@RequestBody ReservationVo reservationVo) {
		
		ResultVo resultVo = null;
		try { 
			final int result = reservationService.deleteReservation(reservationVo);
			resultVo = new ResultVo(result, HttpStatus.OK);
		}
		catch (Exception e) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
			resultVo.setReason("예약 취소에 실패 하였습니다.");
		}
		return resultVo.build();
	}
}
