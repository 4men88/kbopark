package com.baseball.auction.service;

import java.util.List;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.AuctionPageNavigation;
import com.baseball.util.PageNavigation;

public interface AuctionCategoryService {
	List<AuctionDetailDto> auctionCategoryList(String category1, String category2, int pg, int astatus, String sort, String gudan);
	AuctionPageNavigation getAuctionCount(String category1, String category2, int pg, int astatus, String sort, String gudan);
}
