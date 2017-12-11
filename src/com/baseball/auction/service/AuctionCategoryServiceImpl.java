package com.baseball.auction.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baseball.auction.dao.AuctionCategoryDaoImpl;
import com.baseball.auction.model.AuctionDetailDto;

public class AuctionCategoryServiceImpl implements AuctionCategoryService {

	private static AuctionCategoryService auctionCategoryService;
	
	static {
		auctionCategoryService = new AuctionCategoryServiceImpl();
	}
	
	public static AuctionCategoryService getAuctionCategoryService() {
		return auctionCategoryService;
	}

	@Override
	public List<AuctionDetailDto> auctionCategoryList(String category1, String category2) {		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("category1", category1 );
		map.put("category2", category2 );
		return AuctionCategoryDaoImpl.getAuctionCategoryDao().auctionCategoryList(map);
	}
}
