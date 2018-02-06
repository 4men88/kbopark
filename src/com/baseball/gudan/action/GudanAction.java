package com.baseball.gudan.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.baseball.action.Action;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.service.GudanServiceImpl;

public class GudanAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int tno = Integer.parseInt(request.getParameter("tno"));
		GudanDto gudanDto = GudanServiceImpl.getGudanService().gudanArticle(tno);
		System.out.println("GudanAction gudandto >>> " + gudanDto.getEnname());

		List<BoardDto> hotBoard = BoardServiceImpl.getBoardService().hotBoardArticle(tno); //¸®ºä¼ø
		List<AuctionDetailDto> hotAuction = GudanServiceImpl.getGudanService().hotAuctionArticle(tno);
		
		HttpSession gudansession = request.getSession();
		gudansession.setAttribute("gudandto", gudanDto);
		request.setAttribute("hotboard", hotBoard);
		request.setAttribute("hotauction", hotAuction);
		
		return "/gudan/home.jsp";
	}

}