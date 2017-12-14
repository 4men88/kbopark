package com.baseball.auction.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baseball.auction.dao.AuctionCategoryDaoImpl;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.Constance;

public class AuctionCategoryServiceImpl implements AuctionCategoryService {

	private static AuctionCategoryService auctionCategoryService;
	
	static {
		auctionCategoryService = new AuctionCategoryServiceImpl();
	}
	
	public static AuctionCategoryService getAuctionCategoryService() {
		return auctionCategoryService;
	}



	@Override
	public List<AuctionDetailDto> auctionCategoryList(String category1, String category2, int pg, int astatus, String sort, String gudan) {		
		
		int end = pg * Constance.CATEGORY_LIST_SIZE;
		int start = end - Constance.CATEGORY_LIST_SIZE;
		Map<String, String> map = new HashMap<String, String>();
		map.put("astatus", astatus +"");
		map.put("category1", category1);
		map.put("category2", category2);
		map.put("start", start + "");
		map.put("end",  end + "");
		map.put("sort",  sort );
		map.put("gudan",  gudan );
//		map.put("key", key);
//		map.put("word", word);
		return AuctionCategoryDaoImpl.getAuctionCategoryDao().auctionCategoryList(map);
	}

	@Override
	public int getAuctionCount(String category1, String category2, int pg, int astatus, String sort, String gudan) {
		// TODO Auto-generated method stub
		return 0;
	}
}
