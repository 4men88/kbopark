package com.baseball.schedule.scheduledao;

import java.util.List;
import java.util.Map;

import com.baseball.schedule.scheduleDto.ScheduleDto;

public interface ScheduleDao {

	List<ScheduleDto> getSchedule(String date);
	List<ScheduleDto> daySchedule(String date);

}
