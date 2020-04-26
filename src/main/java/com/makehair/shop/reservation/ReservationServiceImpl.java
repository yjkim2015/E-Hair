package com.makehair.shop.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ReservationVo;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
		
	@Override
	public List<ReservationVo> checkReservation(CommonUserVo commonUserVo) {
		return reservationDao.checkReservation(commonUserVo);
	}

	@Override
	public int insertReservation(ReservationVo reservationVo) {
		return reservationDao.insertReservation(reservationVo);
	}

	@Override
	public int deleteReservation(ReservationVo reservationVo) {
		return reservationDao.deleteReservation(reservationVo);
	}
}
