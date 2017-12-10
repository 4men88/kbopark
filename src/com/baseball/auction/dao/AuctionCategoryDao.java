package com.baseball.auction.dao;

import java.util.List;
import java.util.Map;

import com.baseball.auction.model.AuctionDetailDto;

public interface AuctionCategoryDao {
	List<AuctionDetailDto> auctionCategoryList(Map<String, String> map);
}
