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
import javax.servlet.http.HttpSession;

import com.baseball.factory.AuctionActionFactory;
import com.baseball.util.Constance;
import com.baseball.util.PageMove;
import com.baseball.member.action.LoginAction;

@WebServlet("/auctioncontroller")

public class AuctionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/auction.jsp";
		HttpSession session = request.getSession();
		
		if("mainlist".equals(act)) 
		{
			path = AuctionActionFactory.getAuctionMainListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		else if("timelist".equals(act))
		{
			DateFormat df = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
			String time = df.format(new Date());
			response.setContentType("text/plain;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print(time);
		}
		else if("statuschange".equals(act))
		{
			path = AuctionActionFactory.getAuctionEndListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		else if("categorylist".equals(act))
		{
			path = AuctionActionFactory.getAuctionCategoryListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		else if("biddetail".equals(act))
		{
			path = AuctionActionFactory.getAuctionBidDetailAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		else if("bidding".equals(act))
		{
			path = AuctionActionFactory.getAuctionBiddingAction().execute(request, response);
			PageMove.forward(request, response, path);
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
