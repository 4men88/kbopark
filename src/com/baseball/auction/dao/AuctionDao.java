package com.baseball.auction.dao;

import java.util.List;
import com.baseball.auction.model.AuctionDetailDto;

public interface AuctionDao {
	List<AuctionDetailDto> auctionBestList();
	List<AuctionDetailDto> auctionEndList();
	List<AuctionDetailDto> auctionHitList();
	List<AuctionDetailDto> auctionNewList();
}
