package com.baseball.schedule.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.schedule.service.ScheduleServiceImpl;

public class ScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String> map = new HashMap<String, String>();
		
		ScheduleDto scheduleDto = ScheduleServiceImpl.getScheduleService().viewSchedule((ScheduleDto) map);

		request.setAttribute("schedulemap", scheduleDto);

		System.out.println("ScheduleAction" + scheduleDto);
		
		return "/schedule/schedule.jsp";
	}

}
