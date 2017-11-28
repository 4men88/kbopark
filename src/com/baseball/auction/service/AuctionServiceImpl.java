package com.baseball.auction.service;

public class AuctionServiceImpl implements AuctionService {
	
	private static AuctionService auctionService;
	

	static {
		auctionService = new AuctionServiceImpl();
	}
	
	public static AuctionService getAuctionService() {
		return auctionService;
	}
	
}
