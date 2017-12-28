package com.baseball.auction.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.service.AuctionBidDetailServiceImpl;
import com.baseball.util.NullCheck;
import com.baseball.util.StringEncoder;

public class AuctionBidDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//ano,category1,category2,aname,starttime,endtime,bidprice,bidnum,aimage,astatus,acount,initprice,tno
		int ano = NullCheck.nullToOne(request.getParameter("ano"));
		String category1 = StringEncoder.isoToMain(request.getParameter("category1"));
		String category2 = StringEncoder.isoToMain(request.getParameter("category2"));
		String aname = StringEncoder.isoToMain(request.getParameter("aname"));
		String starttime = StringEncoder.isoToMain(request.getParameter("starttime"));
		String endtime = StringEncoder.isoToMain(request.getParameter("endtime"));
		int bidprice = NullCheck.nullToOne(request.getParameter("bidprice"));
		int bidnum = NullCheck.nullToOne(request.getParameter("bidnum"));
		String aimage = StringEncoder.isoToMain(request.getParameter("aimage"));
		int astatus = NullCheck.nullToOne(request.getParameter("astatus"));		
		int acount = NullCheck.nullToOne(request.getParameter("acount"));
		int initprice= NullCheck.nullToOne(request.getParameter("initprice"));
		int tno = NullCheck.nullToOne(request.getParameter("tno"));
		
		AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
		auctionDetailDto.setAno(ano);
		auctionDetailDto.setCategory1(category1);
		auctionDetailDto.setCategory2(category2);
		auctionDetailDto.setAname(aname);
		auctionDetailDto.setStartTime(starttime);
		auctionDetailDto.setEndTime(endtime);
		auctionDetailDto.setBidPrice(bidprice);
		auctionDetailDto.setBidNum(bidnum);
		auctionDetailDto.setAimage(aimage);
		auctionDetailDto.setAstatus(astatus);
		auctionDetailDto.setAcount(acount);
		auctionDetailDto.setInitPrice(initprice);
		auctionDetailDto.setTno(tno);
		
		System.out.println("이미지 경로 :" + aimage);
		System.out.println("종료시간 :" + endtime);
		List<AuctionDetailDto> list = AuctionBidDetailServiceImpl.getAuctionBidDetailService().auctionBidDetailList(ano);
		
		request.setAttribute("list", list);
		request.setAttribute("auctionDetailDto", auctionDetailDto);
		return "/auction/auction-detail.jsp";
	}

}
