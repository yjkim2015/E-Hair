package com.makehair.shop.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.makehair.shop.commom.util.CommonController;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.DayOffVo;
import com.makehair.shop.common.constants.ReservationVo;
import com.makehair.shop.common.constants.ResultVo;
import com.makehair.shop.common.constants.ServiceVo;

@Controller
public class ReservationController extends CommonController {
	
	@Autowired
	private ReservationService reservationService;
	
	@ResponseBody
	@RequestMapping(value="/reservationConfirm", method = RequestMethod.POST)
	public ResponseEntity<ResultVo> reservationConfirm(@RequestBody ReservationVo reservationVo) {
		
		ResultVo resultVo = null;
	
		try {
			int result = reservationService.updateConfirm(reservationVo);
			
			resultVo = new ResultVo(result, HttpStatus.OK);
		}
		catch (Exception ex) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo.build();
	}
	
	@RequestMapping(value="/reservationView", method = RequestMethod.GET)
	public String reservationList(Model model, CommonUserVo adminVo) {
		
		model.addAttribute("adminNo", adminVo.getAdminNo());
		return "/reservation/reservationList";
	}
	
	@ResponseBody
	@RequestMapping(value="/reservationList", method = RequestMethod.POST) 
	public ResponseEntity<ResultVo> reservationList(@RequestBody ReservationVo reservationVo) {
		ResultVo resultVo = null;
		resultVo = new ResultVo(HttpStatus.OK);
		resultVo.setData(reservationService.reservationList(reservationVo));
		return resultVo.build();
	}
	
	@ResponseBody
	@RequestMapping(value="/allService", method = RequestMethod.GET)
	public List<ServiceVo> allService() {
		return reservationService.allService();
	}
	
	@ResponseBody
	@RequestMapping(value="/checkDayOff", method = RequestMethod.GET)
	public List<DayOffVo> checkDayOff(ReservationVo reservationVo) {
		return reservationService.checkDayOff(reservationVo);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkReservation", method = RequestMethod.POST)
	public ResponseEntity<ResultVo> checkReservation(@RequestBody ReservationVo reservationVo) {
		ResultVo resultVo = null;
		try {
			System.out.println("reservationVo : " +reservationVo.toString());
			reservationVo.setReservationDate(reservationVo.getReservationDate().replaceAll("/", "-"));
			final int result = reservationService.checkReservation(reservationVo); 
			System.out.println("result : " + result);
			resultVo = new ResultVo(result, HttpStatus.OK);
			if ( result >= 1 ) {
				throw new Exception();
			}

		}
		catch(Exception ex) {
			resultVo.setReason("먼저 예약된 손님이 있습니다.");

		}
		return resultVo.build();
	}
	
	@RequestMapping(value="/insertReservation", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<ResultVo> insertReservation(@RequestBody ReservationVo reservationVo) {
		
		ResultVo resultVo = null;
		try {
			System.out.println(reservationVo.toString());
			String forCheckReservationData = reservationVo.getReservationDate().replaceAll("/", "-").substring(0,10);
			System.out.println(" forCheckReservationData : " + forCheckReservationData);
			reservationVo.setReservationDate(forCheckReservationData);
			if ( reservationService.checkDuplicateReservation(reservationVo) > 0) {
				resultVo = new ResultVo(3, HttpStatus.OK);
			}
			else {
				reservationVo.setReservationDate(reservationVo.getReservationDate().replaceAll("/", "-"));

				final int result = reservationService.insertReservation(reservationVo);
				resultVo = new ResultVo(result, HttpStatus.OK);
			}
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
