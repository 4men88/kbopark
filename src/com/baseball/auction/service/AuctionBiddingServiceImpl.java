package com.baseball.auction.service;

import java.util.HashMap;
import java.util.Map;

import com.baseball.auction.dao.AuctionBiddingDaoImpl;

public class AuctionBiddingServiceImpl implements AuctionBiddingService {

	private static AuctionBiddingService auctionBiddingService;
	
	static {
		auctionBiddingService = new AuctionBiddingServiceImpl();
	}
	
	public static AuctionBiddingService getAuctionBiddingService() {
		return auctionBiddingService;
	}

	@Override
	public void auctionAddBid(int ano, int bidrookie, String id, int rookie) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ano", ano + "");
		map.put("bidrookie", bidrookie + "");
		map.put("id", id);
		map.put("rookie", rookie + "");
		AuctionBiddingDaoImpl.getAuctionBiddingDao().auctionAddBid(map);
	}
}
