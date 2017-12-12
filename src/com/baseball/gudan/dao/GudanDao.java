package com.baseball.gudan.dao;

import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;

public interface GudanDao {

	String getGudanWeb(int tno);
	String getReservationWeb(int tno);
	GudanDto gudanArticle(int tno);
	StadiumDto stadiumArticle(int sno);
}
