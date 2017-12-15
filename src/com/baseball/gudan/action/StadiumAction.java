package com.baseball.gudan.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.baseball.action.Action;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;
import com.baseball.gudan.service.GudanServiceImpl;

public class StadiumAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int sno = Integer.parseInt(request.getParameter("sno"));
		System.out.println("StadiumAction sno >>> " + sno);
		StadiumDto stadiumDto = GudanServiceImpl.getGudanService().stadiumArticle(sno);
		System.out.println("StadiumAction dto >>> " + stadiumDto.getImage());

		request.setAttribute("stadiumdto", stadiumDto);
		return "/gudan/gujang.jsp";
	}

}
