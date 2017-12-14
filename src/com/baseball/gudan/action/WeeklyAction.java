package com.baseball.gudan.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.baseball.action.Action;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.service.GudanServiceImpl;
import com.baseball.schedule.scheduleDto.ScheduleDto;

public class WeeklyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		HttpSession gudansession = request.getSession();
		GudanDto gudanDto = (GudanDto) gudansession.getAttribute("gudandto");
		
		System.out.println("WeeklyAction " + tno + " " + gudanDto.getTno());
		
		List<ScheduleDto> playList = GudanServiceImpl.getGudanService().weeklyArticle(tno);
		
		request.setAttribute("playlist", playList);
		return "/gudan/weekly.jsp";
	}

}
