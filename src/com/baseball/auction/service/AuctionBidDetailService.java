package com.baseball.auction.service;

import java.util.List;

import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.util.DetailPageNavigation;

public interface AuctionBidDetailService {
	List<AuctionDetailDto> auctionBidDetailList(int ano, int pg);
	DetailPageNavigation makePageNavigation(int ano, int pg);
}
