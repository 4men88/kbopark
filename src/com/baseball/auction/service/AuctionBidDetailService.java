package com.baseball.auction.service;

import java.util.List;

import com.baseball.auction.model.AuctionDetailDto;

public interface AuctionBidDetailService {
	List<AuctionDetailDto> auctionBidDetailList(int ano);
}
