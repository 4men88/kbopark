package com.baseball.auction.controller;

import java.io.IOException;

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
		String path = "/auction.jsp";
		if("bestlist".equals(act)) 
		{
			path = AuctionActionFactory.getAuctionBestListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		else if("endlist".equals(act))
		{
			path = AuctionActionFactory.getAuctionEndListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		if("hitlist".equals(act)) 
		{
			path = AuctionActionFactory.getAuctionHitListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}
		 
		else if("newlist".equals(act)) 
		{
			path = AuctionActionFactory.getAuctionNewListAction().execute(request, response);
			PageMove.forward(request, response, path);
		} 
		else 
		{
		//	PageMove.redirect(request, response, path);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constance.MAIN_ENCODING);
		doGet(request, response);
	}

}
