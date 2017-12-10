package com.baseball.auction.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.auction.service.AuctionServiceImpl;

public class AuctionEndAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ano = request.getParameter("ano");
		String result = AuctionServiceImpl.getAuctionService().auctionStatusEnd(ano) + "";
		
		if(request.equals("0"))
			System.out.println("경매종료후 db수정 실패");
		else
			System.out.println("경매종료후 db수정 성공");
		return "/auctioncontroller?act=mainlist";
			//	"auctioncontroller?act=mainlist";
	}

}
