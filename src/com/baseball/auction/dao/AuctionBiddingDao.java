package com.baseball.auction.dao;

import java.util.Map;

public interface AuctionBiddingDao {
	int auctionAddBid(Map<String, String> map);
}
