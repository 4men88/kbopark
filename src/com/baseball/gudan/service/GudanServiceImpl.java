package com.baseball.gudan.service;

import com.baseball.gudan.dao.GudanDaoImpl;
import com.baseball.gudan.model.GudanDto;

public class GudanServiceImpl implements GudanService {

	private static GudanService gudanService;
	
	static {
		gudanService = new GudanServiceImpl();
	}

	private GudanServiceImpl() {

	}
	
	public static GudanService getGudanService() {
		return gudanService;
	}

	@Override
	public String getGudanWeb(int tno) {
		return GudanDaoImpl.getGudanDao().getGudanWeb(tno);
	}

	@Override
	public String getReservationWeb(int tno) {
		return GudanDaoImpl.getGudanDao().getReservationWeb(tno);
	}

	@Override
	public GudanDto gudanArticle(int tno) {
		return GudanDaoImpl.getGudanDao().gudanArticle(tno);
	}
	
}
