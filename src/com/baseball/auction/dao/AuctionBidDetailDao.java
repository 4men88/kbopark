package com.baseball.auction.dao;

import java.util.List;

import com.baseball.auction.model.AuctionDetailDto;

public interface AuctionBidDetailDao {
	List<AuctionDetailDto> auctionBidDetailList(int ano);
}
