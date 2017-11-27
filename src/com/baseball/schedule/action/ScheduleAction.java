package com.baseball.schedule.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.service.MemberServiceImpl;
import com.baseball.schedule.scheduleDto.ScheduleDto;

public class ScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ScheduleDto scheduleDto = new ScheduleDto();
		
		
		
//		String path="/schedule/schedule.jsp?act=";
		
		
		return "/schedule/schedule.jsp";
	}

}
