package com.baseball.schedule.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.schedule.scheduledao.ScheduleDaoImpl;
import com.baseball.schedule.service.ScheduleServiceImpl;

public class ScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		String year = request.getParameter("y");
//		String mon = request.getParameter("m");
//		if(mon.length()==1) {
//			mon= "0"+mon;
//		}
//		String day = request.getParameter("d");
//		String date = year+mon+day;
		Calendar cal = Calendar.getInstance();
		
		int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR)
				: Integer.parseInt(request.getParameter("y"));
		int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH)
				: (Integer.parseInt(request.getParameter("m")) );
		int day = request.getParameter("d") == null ? cal.get(Calendar.DAY_OF_MONTH)
				: (Integer.parseInt(request.getParameter("d")));
		String date = ""+year;
		if(month>0&& month<10) {
			
			date += "0"+month;
		}else {
			date += ""+month;
		}
		if(day>0&& day<10) {
			
			date += "0"+day;
		}else {
			date += ""+day;
		}
		
		System.out.println(date);
//		String year = request.getParameter("y");
//		String month = request.getParameter("m");
//		String day = request.getParameter("d");
		System.out.println(year + ""+month+""+ day);
		
		System.out.println(date);
		List<ScheduleDto> list = ScheduleDaoImpl.getScheduleDao().daySchedule(date);
	
		request.setAttribute("sch", list);
		System.out.println("ScheduleAction" + list);
	
		return "/schedule/daily.jsp";
	}

}
