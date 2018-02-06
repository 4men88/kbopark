package com.baseball.myinfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.baseball.action.Action;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.gudan.service.GudanServiceImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.myinfo.service.MyinfoServiceImpl;
import com.baseball.util.NullCheck;

public class MoveMyinfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDetailDto mdto = (MemberDetailDto) session.getAttribute("userInfo");
		
		int mtno = NullCheck.nullToZero(mdto.getTno() + "");
		String mid = mdto.getId();
		String mtname = MyinfoServiceImpl.getMs().getMyTname(mtno);
		String myemblem = MyinfoServiceImpl.getMs().getMyEmblem(mtno);
		System.out.println(mtno + " <> " + myemblem);
		
		
		int mrookie = MyinfoServiceImpl.getMs().getMyRookie(mid);
		
		mdto.setFavoriteteam(mtname);
		
		if(mrookie >= 0) {
		mdto.setRookie(mrookie);
		}
		
		
		List<BoardDto> hotBoard = BoardServiceImpl.getBoardService().hotBoardArticle(mtno); //¸®ºä¼ø
		List<AuctionDetailDto> hotAuction = GudanServiceImpl.getGudanService().hotAuctionArticle(mtno);
		request.setAttribute("hotboard", hotBoard);
		request.setAttribute("hotauction", hotAuction);
		
		session.setAttribute("userInfo", mdto);
		request.setAttribute("myemblem", myemblem);
		
		return "/myinfo/myinfo.jsp";
	}

}
