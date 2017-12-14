package com.baseball.auction.service;

import java.util.List;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.PageNavigation;

public interface AuctionCategoryService {
<<<<<<< HEAD
	List<AuctionDetailDto> auctionCategoryList(String category1, String category2, int pg, int astatus);
=======
	List<AuctionDetailDto> auctionCategoryList(String category1, String category2, int pg, int astatus, String sort, String gudan);
	PageNavigation getAuctionCount(String category1, String category2, int pg, int astatus, String sort, String gudan);
>>>>>>> ad94f839fb35a40dbb79a42563887b30a6dff9f2
}
