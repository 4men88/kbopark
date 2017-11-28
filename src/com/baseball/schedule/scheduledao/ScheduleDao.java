package com.baseball.schedule.scheduledao;

import com.baseball.schedule.scheduleDto.ScheduleDto;

public interface ScheduleDao {

	ScheduleDto getSchedule(ScheduleDto scheduleDto);
	
}
