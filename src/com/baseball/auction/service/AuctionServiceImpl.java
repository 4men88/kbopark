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
	public List<AuctionDetailDto> auctionBestList() {
		return AuctionDaoImpl.getAuctionDao().auctionBestList();
	}
	
	@Override
	public List<AuctionDetailDto> auctionEndList() {
		return AuctionDaoImpl.getAuctionDao().auctionEndList();
	}

	@Override
	public List<AuctionDetailDto> auctionHitList() {
		return AuctionDaoImpl.getAuctionDao().auctionHitList();
	}

	@Override
	public List<AuctionDetailDto> auctionNewList() {
		return AuctionDaoImpl.getAuctionDao().auctionNewList();
	}

}
