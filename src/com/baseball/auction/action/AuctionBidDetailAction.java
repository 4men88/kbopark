package com.baseball.auction.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.service.AuctionBidDetailServiceImpl;
import com.baseball.auction.util.DetailPageNavigation;
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
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		
		System.out.println("ano : " + ano);
		System.out.println("pg : " + pg);
		System.out.println("starttime" + starttime);
		System.out.println("endtime" + endtime);
		
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
		acount += 1;
		auctionDetailDto.setAcount(acount);
		auctionDetailDto.setInitPrice(initprice);
		auctionDetailDto.setTno(tno);
		
		List<AuctionDetailDto> list = AuctionBidDetailServiceImpl.getAuctionBidDetailService().auctionBidDetailList(ano, pg);
		DetailPageNavigation detailPageNavigation = AuctionBidDetailServiceImpl.getAuctionBidDetailService().makePageNavigation(ano, pg); 
		detailPageNavigation.setRoot(request.getContextPath());
//		detailPageNavigation.setCategoty1(category1);
//		detailPageNavigation.setCategoty1(category2);
//		detailPageNavigation.setKey(key);
//		detailPageNavigation.setWord(word);
//		detailPageNavigation.setGudan(gudan);
		detailPageNavigation.setAno(ano);
		detailPageNavigation.setConNavigator();
		
		System.out.println("list size : " + list.size());
		request.setAttribute("list", list);
		request.setAttribute("auctionDetailDto", auctionDetailDto);
		request.setAttribute("detailPageNavigation", detailPageNavigation);
		return "/auction/auction-detail.jsp";
	}

}
