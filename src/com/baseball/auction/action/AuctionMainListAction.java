package com.baseball.auction.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.INTERNAL;

import com.baseball.action.Action;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.service.AuctionServiceImpl;

public class AuctionMainListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		List<AuctionDetailDto> bestList = AuctionServiceImpl.getAuctionService().auctionBestList();
		List<AuctionDetailDto> endList = AuctionServiceImpl.getAuctionService().auctionEndList();
		List<AuctionDetailDto> hitList = AuctionServiceImpl.getAuctionService().auctionHitList();
		List<AuctionDetailDto> newList = AuctionServiceImpl.getAuctionService().auctionNewList();
		List<Integer> newNumArray = AuctionServiceImpl.getAuctionService().auctionNewNumArray();

		System.out.println("endList»óÅÂ: " + endList.get(0).getAstatus());
		System.out.println("newNumArray1 = " + newNumArray.get(0));
		System.out.println("newNumArray2 = " + newNumArray.get(1));
		System.out.println("newNumArray3 = " + newNumArray.get(2));
		System.out.println("newNumArray4 = " + newNumArray.get(3));
		System.out.println("newNumArray5 = " + newNumArray.get(4));
		request.setAttribute("newNumArray", newNumArray);
		request.setAttribute("bestList", bestList);
		request.setAttribute("endList", endList);
		request.setAttribute("hitList", hitList);
		request.setAttribute("newList", newList);

		return "/auction/auction.jsp";
	}
}
