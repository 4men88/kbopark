package com.baseball.factory;

import com.baseball.auction.action.AuctionBidDetailAction;
import com.baseball.auction.action.AuctionCategoryListAction;
import com.baseball.auction.action.AuctionEndAction;
import com.baseball.auction.action.AuctionMainListAction;

public class AuctionActionFactory {

	private static AuctionMainListAction auctionMainListAction;
	private static AuctionEndAction auctionEndAction;
	private static AuctionCategoryListAction auctionCategoryListAction;
	private static AuctionBidDetailAction auctionBidDetailAction;

	static {
		auctionMainListAction = new AuctionMainListAction();
		auctionEndAction = new AuctionEndAction();
		auctionCategoryListAction = new AuctionCategoryListAction();
		auctionBidDetailAction = new AuctionBidDetailAction();
	}
	
	public static AuctionEndAction getAuctionEndListAction() {
		return auctionEndAction;
	}
	
	public static AuctionMainListAction getAuctionMainListAction() {
		return auctionMainListAction;
	}

	public static AuctionCategoryListAction getAuctionCategoryListAction() {
		return auctionCategoryListAction;
	}
	
	public static AuctionBidDetailAction getAuctionBidDetailAction() {
		return auctionBidDetailAction;
	}
}
