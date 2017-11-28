package com.baseball.factory;

import com.baseball.auction.action.AuctionMainListAction;

public class AuctionActionFactory {

	private static AuctionMainListAction auctionMainListAction;
	

	static {
		auctionMainListAction = new AuctionMainListAction();
	}
	
	public static AuctionMainListAction getAuctionMainListAction() {
		return auctionMainListAction;
	}
	
}
