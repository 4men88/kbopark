package com.baseball.auction.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.auction.dao.AuctionCategoryDaoImpl;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.service.AuctionCategoryServiceImpl;
import com.baseball.util.AuctionPageNavigation;
import com.baseball.util.Constance;
import com.baseball.util.NullCheck;
import com.baseball.util.StringEncoder;

public class AuctionCategoryListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category1 = StringEncoder.isoToMain(request.getParameter("category1"));
		String category2 = StringEncoder.isoToMain(request.getParameter("category2"));
		
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		int conpg = NullCheck.nullToOne(request.getParameter("conpg"));
		int endpg = NullCheck.nullToOne(request.getParameter("endpg"));
		int choice = NullCheck.nullToOne(request.getParameter("choice"));
		String sort = StringEncoder.isoToMain(request.getParameter("sort"));
		String gudan = StringEncoder.isoToMain(request.getParameter("gudan"));	
		
		System.out.println("gudan =====================" + gudan);
		// 경매상태 진행중 리스트
		
		
		List<AuctionDetailDto> categoryConList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, conpg, 1, sort, gudan);
		AuctionPageNavigation conPageNavigation = AuctionCategoryServiceImpl.getAuctionCategoryService().getAuctionCount(category1, category2, conpg, 1, sort, gudan);
		conPageNavigation.setRoot(request.getContextPath());
		conPageNavigation.setCategoty1(category1);
		conPageNavigation.setCategoty1(category2);
		conPageNavigation.setKey(key);
		conPageNavigation.setWord(word);
		conPageNavigation.setGudan(gudan);
		conPageNavigation.setConNavigator();
		// 경매상태  완료 리스트
		List<AuctionDetailDto> categoryEndList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, endpg, 2, sort, gudan);
		AuctionPageNavigation endPageNavigation = AuctionCategoryServiceImpl.getAuctionCategoryService().getAuctionCount(category1, category2, endpg, 2, sort, gudan);
		endPageNavigation.setRoot(request.getContextPath());
		endPageNavigation.setCategoty1(category1);
		endPageNavigation.setCategoty1(category2);
		endPageNavigation.setKey(key);
		endPageNavigation.setWord(word);
		endPageNavigation.setGudan(gudan);
		endPageNavigation.setEndNavigator();
		
		
		request.setAttribute("categoryConList", categoryConList);
		request.setAttribute("conPageNavigation", conPageNavigation);
		
		request.setAttribute("categoryEndList", categoryEndList);
		request.setAttribute("endPageNavigation", endPageNavigation);
		
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		
		request.setAttribute("conpg", conpg + "");
		request.setAttribute("endpg", endpg + "");
		request.setAttribute("choice", choice + "");
				
		return "/auction/auction-category.jsp";
	}
}
