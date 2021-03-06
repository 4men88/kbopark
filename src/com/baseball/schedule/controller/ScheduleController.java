package com.baseball.schedule.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.ScheduleActionFactory;
import com.baseball.util.PageMove;

@WebServlet("/ScheduleController")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("ScheduleController act ==" + act);
		
		String path = "/index.jsp";
		
		if("daliyview".equals(act)) {
			path = ScheduleActionFactory.getScheduleAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if("monthlyview".equals(act)) {
			path = ScheduleActionFactory.getMonthlyAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if("".equals(act)) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
