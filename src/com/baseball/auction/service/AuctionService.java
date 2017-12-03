package com.baseball.auction.service;

import java.util.List;
import com.baseball.auction.model.AuctionDetailDto;

public interface AuctionService {
	
	List<AuctionDetailDto> auctionBestList();
	List<AuctionDetailDto> auctionEndList();
	List<AuctionDetailDto> auctionHitList();
	List<AuctionDetailDto> auctionNewList();
}	

