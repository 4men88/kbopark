package com.baseball.gudan.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		request.setAttribute("gudandto", gudanDto);
		return "";
	}

}