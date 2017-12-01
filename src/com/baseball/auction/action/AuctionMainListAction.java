package com.baseball.auction.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.service.AuctionServiceImpl;

public class AuctionMainListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AuctionDetailDto> list = AuctionServiceImpl.getAuctionService().auctionEndList();
		request.setAttribute("auctionDetailDto", list);
		System.out.println("3");
		return "/auction/auction.jsp";
	}

}
