package com.baseball.auction.service;

import java.util.List;

import com.baseball.auction.dao.AuctionDaoImpl;
import com.baseball.auction.model.AuctionDetailDto;

public class AuctionServiceImpl implements AuctionService {

	private static AuctionService auctionService;
	
	static {
		auctionService = new AuctionServiceImpl();
	}
	
	public static AuctionService getAuctionService() {
		return auctionService;
	}

	@Override
	public List<AuctionDetailDto> auctionEndList() {
		return AuctionDaoImpl.getAuctionDao().auctionEndList();
	}

}
