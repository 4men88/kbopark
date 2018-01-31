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
	public int auctionAddBid(int ano, int bidRookie, String id, int rookie) {
		System.out.println("bidRookie = " + bidRookie);
		Map<String, String> map = new HashMap<String, String>();
		map.put("ano", ano + "");
		map.put("bidRookie", bidRookie + "");
		map.put("id", id);
		map.put("rookie", rookie + "");
		int res = AuctionBiddingDaoImpl.getAuctionBiddingDao().auctionAddBid(map);
		return res;
	}
}
