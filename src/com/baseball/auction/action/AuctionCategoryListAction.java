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
import com.baseball.util.StringEncoder;

public class AuctionCategoryListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category1 = StringEncoder.isoToMain(request.getParameter("category1"));
		String category2 = StringEncoder.isoToMain(request.getParameter("category2"));
//		String key = StringEncoder.isoToMain(request.getParameter("key"));
//		String word = StringEncoder.isoToMain(request.getParameter("word"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		int sort = NullCheck.nullToOne(request.getParameter("sort"));
		System.out.println("pg =====================" + pg);
		// 경매상태 진행중 리스트
		List<AuctionDetailDto> categoryConList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, pg, 1, sort);
		// 경매상태 진행중 완료
		List<AuctionDetailDto> categoryEndList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category2, pg, 2, sort);
		 
		request.setAttribute("categoryConList", categoryConList);
		request.setAttribute("categoryEndList", categoryEndList);
		return "/auction/auction-category.jsp";
	}
}
