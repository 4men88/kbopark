package com.baseball.gudan.service;

import java.text.SimpleDateFormat;
import java.util.*;

import com.baseball.gudan.dao.GudanDaoImpl;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;
import com.baseball.schedule.scheduleDto.ScheduleDto;

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

	@Override
	public StadiumDto stadiumArticle(int sno) {
		return GudanDaoImpl.getGudanDao().stadiumArticle(sno);
	}

	@Override
	public List<ScheduleDto> weeklyArticle(int tno) {
		List<ScheduleDto> list = new ArrayList<ScheduleDto>();
		List<String> weekday = new ArrayList<String>();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); 
		weekday.add(formatter.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY); 
		weekday.add(formatter.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY); 
		weekday.add(formatter.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY); 
		weekday.add(formatter.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY); 
		weekday.add(formatter.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY); 
		weekday.add(formatter.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY); 
		weekday.add(formatter.format(cal.getTime()));

		for(int i=0;i<7;i++) {
			list.add(GudanDaoImpl.getGudanDao().weeklyArticle(tno, weekday.get(i)));
		}
		
		return list;
	}
	
	@Override
	public List<StadiumDto> weeklyStadium(int tno) {
		List<StadiumDto> stadiumlist = new ArrayList<StadiumDto>();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); 
		
		String monday = "";
		monday = formatter.format(cal.getTime());
		
		stadiumlist = GudanDaoImpl.getGudanDao().weeklyStadium(tno, monday);
		
		return stadiumlist;
	}
	
}
