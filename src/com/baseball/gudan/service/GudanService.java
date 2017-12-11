package com.baseball.gudan.service;

import com.baseball.gudan.model.GudanDto;

public interface GudanService {
	
	String getGudanWeb(int tno);
	String getReservationWeb(int tno);
	GudanDto gudanArticle(int tno);
}
