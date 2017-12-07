package com.baseball.gudan.service;

import com.baseball.gudan.dao.GudanDaoImpl;

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
	
	
}
