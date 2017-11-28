package com.baseball.schedule.service;

import com.baseball.schedule.scheduleDto.ScheduleDto;
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
		System.out.println("ScheduleServiceImpl ¿Ô³ª ?");
				
		return ScheduleDaoImpl.getScheduleDao().getSchedule(scheduleDto);
	}
	
	

}
