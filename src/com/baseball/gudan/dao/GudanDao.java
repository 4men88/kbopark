package com.baseball.gudan.dao;

import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;
import com.baseball.schedule.scheduleDto.ScheduleDto;

public interface GudanDao {

	String getGudanWeb(int tno);
	String getReservationWeb(int tno);
	GudanDto gudanArticle(int tno);
	StadiumDto stadiumArticle(int sno);
	ScheduleDto weeklyArticle(int tno, String day);

}
