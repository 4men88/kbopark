package com.baseball.auction.service;

import java.util.List;

import com.baseball.auction.dao.AuctionBidDetailDaoImpl;
import com.baseball.auction.model.AuctionDetailDto;

public class AuctionBidDetailServiceImpl implements AuctionBidDetailService {

	private static AuctionBidDetailService auctionBidDetailService;
	
	static {
		auctionBidDetailService = new AuctionBidDetailServiceImpl();
	}
	
	public static AuctionBidDetailService getAuctionBidDetailService() {
		return auctionBidDetailService;
	}
	
	@Override
	public List<AuctionDetailDto> auctionBidDetailList(int ano) {
		
		return AuctionBidDetailDaoImpl.getAuctionBidDetailDao().auctionBidDetailList(ano);		
	}

}
