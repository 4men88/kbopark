package com.baseball.auction.dao;

public class AuctionEndDaoImpl implements AuctionEndDao {

	private static AuctionEndDao auctionEndDao;

	static {
		auctionEndDao = new AuctionEndDaoImpl();
	}
	
	public static AuctionEndDao getAuctionEndDao() {
		return auctionEndDao;
	}

	@Override
	public int auctionStatusEnd() {		
		return 0;
	}
	
}
