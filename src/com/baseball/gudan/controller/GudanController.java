package com.baseball.gudan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.GudanActionFactory;
import com.baseball.gudan.service.GudanServiceImpl;
import com.baseball.util.NullCheck;
import com.baseball.util.PageMove;
import com.baseball.util.StringEncoder;

@WebServlet("/gudan")
public class GudanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		
		String act = request.getParameter("act");
		int tno = NullCheck.nullToZero(request.getParameter("tno"));
		System.out.println("GudanController act >>> " + act);
				
		String path = "/index.jsp";
		if("viewgudan".equals(act)) {
			path = "/gudan/teammain.jsp";
			PageMove.forward(request, response, path);
		} else if ("mvhome".equals(act)) {
			path = GudanActionFactory.getGudanAction().execute(request, response);
//			path += queryString;
			PageMove.forward(request, response, path);			
		} else if ("mvstadium".equals(act)) {
			path = GudanActionFactory.getStadiumAction().execute(request, response);
			PageMove.forward(request, response, path);			
		} else if ("mvweekly".equals(act)) {
			path = GudanActionFactory.getWeeklyAction().execute(request, response);
			PageMove.forward(request, response, path);			
		} else if ("mvcommunity".equals(act)) {
			path = "/community/list.jsp";
			PageMove.forward(request, response, path);			
		} else if("mvteamweb".equals(act)) {	//각구단공식홈페이지로이동
			System.out.println("GudanController tno >>> " + tno);
			path = GudanServiceImpl.getGudanService().getGudanWeb(tno);
			System.out.println("GudanController path >>> " + path);
			response.sendRedirect(path);
		} else if("mvreservation".equals(act)) {
			System.out.println("GudanController tno >>> " + tno);
			path = GudanServiceImpl.getGudanService().getReservationWeb(tno);
			System.out.println("GudanController path >>> " + path);
			response.sendRedirect(path);		
		} else if("timer".equals(act)) {
			String time = GudanActionFactory.getTimeAction().execute(request, response);
			response.setContentType("text/plain;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print(time);
		}
		else if("".equals(act)) {
			PageMove.redirect(request, response, path);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}
	
}
