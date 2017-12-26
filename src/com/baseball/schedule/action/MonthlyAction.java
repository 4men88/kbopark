package com.baseball.schedule.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.schedule.scheduledao.ScheduleDaoImpl;
import com.baseball.util.NullCheck;

public class MonthlyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, List<ScheduleDto>> map = new HashMap<String, List<ScheduleDto>>();
		int year = NullCheck.nullToZero(request.getParameter("y"));
		int month = NullCheck.nullToZero(request.getParameter("m"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = new GregorianCalendar(year, month-1, 1);
		
		int maxday = cal.getActualMaximum(cal.DAY_OF_MONTH);
		
		String date = "";
		for(int i=0;i<maxday;i++) {
			date = formatter.format(cal.getTime());
			List<ScheduleDto> list = ScheduleDaoImpl.getScheduleDao().getSchedule(date);
			map.put(date, list);
			
			cal.add(Calendar.DATE, 1);
		}
		
		System.out.println("MonthlyAction mapsize >> " + map.size());
		
		request.setAttribute("monthlymap", map);
		return "/schedule/monthly.jsp";
	}
}
