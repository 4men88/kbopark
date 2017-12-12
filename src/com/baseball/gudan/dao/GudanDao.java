package com.baseball.gudan.dao;

import com.baseball.gudan.model.GudanDto;

public interface GudanDao {

	String getGudanWeb(int tno);
	String getReservationWeb(int tno);
	GudanDto gudanArticle(int tno);
}
