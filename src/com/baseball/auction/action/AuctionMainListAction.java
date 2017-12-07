package com.baseball.auction.action;

import java.io.IOException;
import java.util.ArrayList;
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
	
		List<AuctionDetailDto> bestList = AuctionServiceImpl.getAuctionService().auctionBestList();
		List<AuctionDetailDto> endList = AuctionServiceImpl.getAuctionService().auctionEndList();
		List<AuctionDetailDto> hitList = AuctionServiceImpl.getAuctionService().auctionHitList();
		List<AuctionDetailDto> newList = AuctionServiceImpl.getAuctionService().auctionNewList();
		System.out.println("디비 : " + bestList.get(0).getEndTime());
//		for(int i=0; i<bestList.size() + endList.size() + hitList.size() + newList.size(); i++)
//		{
//			mainList.add(list.get(i));
//		}
//		System.out.println(list.get(0).getAimage());
//		System.out.println(list.get(1).getAimage());
		System.out.println("디비: " + bestList.get(0).getEndTime());
		request.setAttribute("bestList", bestList);
		request.setAttribute("endList", endList);
		request.setAttribute("hitList", hitList);
		request.setAttribute("newList", newList);

		return "/auction/auction.jsp";
	}
}
