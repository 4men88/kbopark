package com.baseball.auction.service;

import java.util.List;

import com.baseball.auction.dao.AuctionMainDaoImpl;
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
	public List<AuctionDetailDto> auctionBestList() {
		return AuctionMainDaoImpl.getAuctionDao().auctionBestList();
	}
	
	@Override
	public List<AuctionDetailDto> auctionEndList() {
		return AuctionMainDaoImpl.getAuctionDao().auctionEndList();
	}

	@Override
	public List<AuctionDetailDto> auctionHitList() {
		return AuctionMainDaoImpl.getAuctionDao().auctionHitList();
	}

	@Override
	public List<AuctionDetailDto> auctionNewList() {
		return AuctionMainDaoImpl.getAuctionDao().auctionNewList();
	}

}
