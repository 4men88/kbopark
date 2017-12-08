package com.baseball.schedule.service;

import java.sql.Date;
import java.util.List;

import com.baseball.schedule.scheduleDto.ScheduleDto;

public interface ScheduleService {
	
	List<ScheduleDto> viewSchedule();// db에 있는 일정 가져와라
	
	
	
	

}
