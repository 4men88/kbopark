package com.baseball.auction.service;

import java.util.List;

import com.baseball.auction.dao.AuctionEndDaoImpl;
import com.baseball.auction.dao.AuctionMainDaoImpl;
import com.baseball.auction.model.AuctionDetailDto;

public class AuctionMainServiceImpl implements AuctionMainService {

	private static AuctionMainService auctionService;
	
	static {
		auctionService = new AuctionMainServiceImpl();
	}
	
	public static AuctionMainService getAuctionService() {
		return auctionService;
	}

	@Override
	public List<AuctionDetailDto> auctionBestList() {
		return AuctionMainDaoImpl.getAuctionMainDao().auctionBestList();
	}
	
	@Override
	public List<AuctionDetailDto> auctionEndList() {
		return AuctionMainDaoImpl.getAuctionMainDao().auctionEndList();
	}

	@Override
	public List<AuctionDetailDto> auctionHitList() {
		return AuctionMainDaoImpl.getAuctionMainDao().auctionHitList();
	}

	@Override
	public List<AuctionDetailDto> auctionNewList() {
		return AuctionMainDaoImpl.getAuctionMainDao().auctionNewList();
	}

	@Override
	public int auctionStatusEnd(String ano) {			
		return AuctionEndDaoImpl.getAuctionEndDao().auctionStatusEnd(ano);
		//
	}

	@Override
	public List<Integer> auctionNewNumArray() {		
		return AuctionMainDaoImpl.getAuctionMainDao().auctionNewNumArray();
	}
	

}
