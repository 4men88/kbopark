package com.baseball.auction.controller;

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

import com.baseball.factory.AuctionActionFactory;
import com.baseball.util.Constance;
import com.baseball.util.PageMove;

@WebServlet("/auctionlist")

public class AuctionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		String act = request.getParameter("act");
		System.out.println(act);
		String path = "/auction.jsp";
		if("mainlist".equals(act)) 
		{
			path = AuctionActionFactory.getAuctionMainListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		else if("timelist".equals(act))
		{
			DateFormat df = new SimpleDateFormat("yy.mm.dd hh:mm:ss");
			String time = df.format(new Date());
			System.out.println(time);
			response.setContentType("text/plain;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print(time);
//			out.print("<font color='red' size='5'><b>" + time + "</b></font>");
		}
		else 
		{
			PageMove.redirect(request, response, path);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constance.MAIN_ENCODING);
		doGet(request, response);
	}

}
