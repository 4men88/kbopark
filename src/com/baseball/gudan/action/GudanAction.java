package com.baseball.gudan.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.baseball.action.Action;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.service.GudanServiceImpl;

public class GudanAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int tno = Integer.parseInt(request.getParameter("tno"));
		GudanDto gudanDto = GudanServiceImpl.getGudanService().gudanArticle(tno);
		System.out.println("GudanAction gudandto >>> " + gudanDto.getEnname());

		HttpSession gudansession = request.getSession();
		gudansession.setAttribute("gudandto", gudanDto);
//		request.setAttribute("gudandto", gudanDto);
		return "/gudan/home.jsp";
	}

}