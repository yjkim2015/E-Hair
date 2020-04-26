package com.makehair.shop.reservation;

import java.util.List;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReservationVo;

public interface ReservationService {
	
	public List<ReservationVo> checkReservation(CommonUserVo commonUserVo);
	
	public int insertReservation(ReservationVo reservationVo);
	
	public int deleteReservation(ReservationVo reservationVo);
	
}
