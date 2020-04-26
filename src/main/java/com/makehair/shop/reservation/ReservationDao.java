package com.makehair.shop.reservation;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReservationVo;


@Repository
public interface ReservationDao {
	
	public List<ReservationVo> checkReservation(CommonUserVo commonUserVo);

	public int insertReservation(ReservationVo reservationVo);
	
	public int deleteReservation(ReservationVo reservationVo);
}
