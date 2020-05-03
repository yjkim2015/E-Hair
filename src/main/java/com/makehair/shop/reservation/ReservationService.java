package com.makehair.shop.reservation;


import java.util.List;

import com.makehair.shop.common.constants.DayOffVo;
import com.makehair.shop.common.constants.ReservationVo;
import com.makehair.shop.common.constants.ServiceVo;

public interface ReservationService {
	
	public List<DayOffVo> checkDayOff(ReservationVo reservationVo);
	
	public List<ServiceVo> allService();
	
	public int checkReservation(ReservationVo reservationVo);
	
	public int insertReservation(ReservationVo reservationVo);
	
	public int deleteReservation(ReservationVo reservationVo);
	
}
