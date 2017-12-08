package com.baseball.factory;

import com.baseball.auction.action.AuctionEndAction;
import com.baseball.auction.action.AuctionMainListAction;

public class AuctionActionFactory {

	private static AuctionMainListAction auctionMainListAction;
	private static AuctionEndAction auctionEndAction;

	static {
		auctionMainListAction = new AuctionMainListAction();
		auctionEndAction = new AuctionEndAction();
	}
	
	public static AuctionEndAction getAuctionEndListAction() {
		return auctionEndAction;
	}
	
	public static AuctionMainListAction getAuctionMainListAction() {
		return auctionMainListAction;
	}

}
