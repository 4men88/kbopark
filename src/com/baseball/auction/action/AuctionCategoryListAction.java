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
import com.baseball.util.StringEncoder;

public class AuctionCategoryListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category1 = StringEncoder.isoToMain(request.getParameter("category1"));
		String category2 =StringEncoder.isoToMain( request.getParameter("category2"));
		 List<AuctionDetailDto> categoryAllList = AuctionCategoryServiceImpl.getAuctionCategoryService().auctionCategoryList(category1, category1);
		 
		 request.setAttribute("categoryAllList", categoryAllList);
		 return "/auction/auction-category.jsp";
	}

}
