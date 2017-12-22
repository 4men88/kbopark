package com.baseball.schedule.action;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.schedule.scheduledao.ScheduleDaoImpl;

public class MonthlyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String year = request.getParameter("y");
//		String mon = request.getParameter("m");
//		String date = year+mon;
//		System.out.println(mon);
//		String date = ""+year;
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
		
		List<ScheduleDto> list = ScheduleDaoImpl.getScheduleDao().getSchedule(date);
		
//		System.out.println(year+mon);
		request.setAttribute("sch", list);
		System.out.println("ScheduleAction" + list);
		
		return "/schedule/monthly.jsp";
		
	}

}
