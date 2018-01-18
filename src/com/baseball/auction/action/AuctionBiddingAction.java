package com.baseball.auction.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.auction.dao.AuctionCommonDaoImpl;
import com.baseball.auction.service.AuctionBiddingServiceImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.util.NullCheck;

public class AuctionBiddingAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("bidrookie = " + request.getParameter("bidrookie"));
		System.out.println("ano = " + request.getParameter("ano"));
		int ano = NullCheck.nullToOne(request.getParameter("ano"));
		int bidrookie = NullCheck.nullToOne(request.getParameter("bidrookie"));
		
		HttpSession session = request.getSession();		
        MemberDetailDto memberd = (MemberDetailDto)session.getAttribute("userInfo");
        System.out.println("������Ű : "+memberd.getRookie());        
        memberd.setRookie(memberd.getRookie() - bidrookie);
        System.out.println("������Ű : "+memberd.getRookie());
      
		int bidres = AuctionBiddingServiceImpl.getAuctionBiddingService().auctionAddBid(ano, bidrookie, memberd.getId(), memberd.getRookie());
		if(bidres == 0)
			System.out.println("���� db���� ����, res = " + bidres);
		else if(bidres == 1)
			System.out.println("���� db���� ����, res = " + bidres);	
		request.setAttribute("bidres", bidres);
		
		// http://localhost/kbopark/auctioncontroller?act=mainlist����
		// /auctioncontroller?act=mainlist�޺κ� �� -> ���� �������� �̵�
		System.out.println(request.getHeader("referer").substring(24));
		return request.getHeader("referer").substring(24);

	}
}
