package com.baseball.schedule.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.schedule.scheduledao.ScheduleDao;
import com.baseball.schedule.scheduledao.ScheduleDaoImpl;

public class ScheduleServiceImpl implements ScheduleService {
	
	private static ScheduleService scheduleService;
	
	static {
		
		scheduleService = new ScheduleServiceImpl();
		
	}
	
	private ScheduleServiceImpl() {
	}
	

	public static ScheduleService getScheduleService() {
		return scheduleService;
	}

	@Override
	public ScheduleDto viewSchedule(ScheduleDto scheduleDto) {
		Map<String, String> map = new HashMap<String, String>();
		String playdate = scheduleDto.getPlaydate();
		int score1 = scheduleDto.getScore1();
		int score2 = scheduleDto.getScore2();
		String pstatus = scheduleDto.getPstatus();
		String sname = scheduleDto.getSname();
		String tname = scheduleDto.getTname();
		String emblem = scheduleDto.getEmblem();
		
		map.put("playdate", playdate);
		map.put("score1", score1 + "");
		map.put("score2", score2 + "");
		map.put("pstatus", pstatus);
		map.put("sname", sname);
		map.put("tname", tname);
		map.put("emblem", emblem);
		
		System.out.println("ScheduleServiceImpl" + map);
		
		return ScheduleDaoImpl.getScheduleDao().getSchedule(map);
	}

}
