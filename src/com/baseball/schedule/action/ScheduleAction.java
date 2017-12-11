package com.baseball.schedule.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.schedule.service.ScheduleServiceImpl;

public class ScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			
		List<ScheduleDto> list = ScheduleServiceImpl.getScheduleService().viewSchedule();

		HttpSession session = request.getSession();
		session.setAttribute("viewschedule", list);

		System.out.println("ScheduleAction" + list);
		
		return "/schedule/monthly.jsp";
	}

}
