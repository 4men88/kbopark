package com.baseball.gudan.service;

import java.util.List;

import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;
import com.baseball.schedule.scheduleDto.ScheduleDto;

public interface GudanService {
	
	String getGudanWeb(int tno);
	String getReservationWeb(int tno);
	GudanDto gudanArticle(int tno);
	StadiumDto stadiumArticle(int sno);
	List<ScheduleDto> weeklyArticle(int tno);
	List<StadiumDto> weeklyStadium(int tno);
	List<AuctionDetailDto> hotAuctionArticle(int tno);

}
