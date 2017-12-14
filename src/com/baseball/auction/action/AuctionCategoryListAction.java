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
import com.baseball.util.Constance;
import com.baseball.util.NullCheck;
import com.baseball.util.PageNavigation;
import com.baseball.util.StringEncoder;

public class AuctionCategoryListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category1 = StringEncoder.isoToMain(request.getParameter("category1"));
		String category2 = StringEncoder.isoToMain(request.getParameter("category2"));
		
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		System.out.println("pg =====================" + pg);
		// ��Ż��� ������ ����Ʈ
<<<<<<< HEAD
		List<AuctionDetailDto> categoryConList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, pg, 1);
		// ��Ż��� ������ �Ϸ�
		List<AuctionDetailDto> categoryEndList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, pg, 2);
		 
=======
		List<AuctionDetailDto> categoryConList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, pg, 1, sort, gudan);
		PageNavigation conPageNavigation = AuctionCategoryServiceImpl.getAuctionCategoryService().getAuctionCount(category1, category2, pg, 1, sort, gudan);
		conPageNavigation.setRoot(request.getContextPath());
		conPageNavigation.setCategory1(category1);
		conPageNavigation.setCategory1(category2);
		conPageNavigation.setKey(key);
		conPageNavigation.setWord(word);
		conPageNavigation.setNavigator();
		// ��Ż���  �Ϸ� ����Ʈ
		List<AuctionDetailDto> categoryEndList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, pg, 2, sort, gudan);
		PageNavigation endPageNavigation = AuctionCategoryServiceImpl.getAuctionCategoryService().getAuctionCount(category1, category2, pg, 2, sort, gudan);
		endPageNavigation.setRoot(request.getContextPath());
		endPageNavigation.setCategory1(category1);
		endPageNavigation.setCategory1(category2);
		endPageNavigation.setKey(key);
		endPageNavigation.setWord(word);
		endPageNavigation.setNavigator();
		
>>>>>>> ad94f839fb35a40dbb79a42563887b30a6dff9f2
		request.setAttribute("categoryConList", categoryConList);
		request.setAttribute("categoryEndList", categoryEndList);
		return "/auction/auction-category.jsp";
	}
}
