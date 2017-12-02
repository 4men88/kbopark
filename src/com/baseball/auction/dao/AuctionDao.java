package com.baseball.auction.dao;

import java.util.List;
import com.baseball.auction.model.AuctionDetailDto;

public interface AuctionDao {
	List<AuctionDetailDto> auctionEndList();
}
