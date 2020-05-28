package com.makehair.shop.reservation;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makehair.shop.common.constants.DayOffVo;
import com.makehair.shop.common.constants.ReservationVo;
import com.makehair.shop.common.constants.ServiceVo;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
		
	@Override
	public int checkReservation(ReservationVo reservationVo) {
		return reservationDao.checkReservation(reservationVo);
	}

	@Override
	public int insertReservation(ReservationVo reservationVo) {
		return reservationDao.insertReservation(reservationVo);
	}

	@Override
	public int deleteReservation(ReservationVo reservationVo) {
		return reservationDao.deleteReservation(reservationVo);
	}

	@Override
	public List<ServiceVo> allService() {
		return reservationDao.allService();
	}

	@Override
	public List<DayOffVo> checkDayOff(ReservationVo reservationVo) {
		return reservationDao.checkDayOff(reservationVo);
	}

	@Override
	public int checkDuplicateReservation(ReservationVo reservationVo) {
		return reservationDao.checkDuplicateReservation(reservationVo);
	}

	@Override
	public List<ReservationVo> reservationList(ReservationVo reservationVo) {
		return reservationDao.reservationList(reservationVo);
	}

	@Override
	public int updateConfirm(ReservationVo reservationVo) {
		return reservationDao.updateConfirm(reservationVo);
	}
}
