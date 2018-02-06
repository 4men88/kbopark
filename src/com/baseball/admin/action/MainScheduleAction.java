package com.baseball.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.schedule.scheduleDto.ScheduleDto;

public class MainScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/index.jsp";
		List<ScheduleDto> todaylist = AdminServiceImpl.getAdminService().getPlayToday();
		System.out.println("todaylist"+todaylist);
		request.setAttribute("todaylist", todaylist);
		path="/admin/main/todayschedulexml.jsp";
		return path;
	}

}
