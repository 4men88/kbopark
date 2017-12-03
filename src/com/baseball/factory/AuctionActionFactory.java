package com.baseball.factory;

import com.baseball.auction.action.AuctionBestListAction;
import com.baseball.auction.action.AuctionEndListAction;
import com.baseball.auction.action.AuctionHitListAction;
import com.baseball.auction.action.AuctionNewListAction;

public class AuctionActionFactory {

	private static AuctionBestListAction auctionBestListAction;
	private static AuctionEndListAction auctionEndListAction;
	private static AuctionHitListAction auctionHitListAction;
	private static AuctionNewListAction auctionNewListAction;
	

	static {
		auctionBestListAction = new AuctionBestListAction();
		auctionEndListAction = new AuctionEndListAction();
		auctionHitListAction = new AuctionHitListAction();
		auctionNewListAction = new AuctionNewListAction();
	}
	
	public static AuctionBestListAction getAuctionBestListAction() {
		return auctionBestListAction;
	}

	public static AuctionEndListAction getAuctionEndListAction() {
		return auctionEndListAction;
	}

	public static AuctionHitListAction getAuctionHitListAction() {
		return auctionHitListAction;
	}

	public static AuctionNewListAction getAuctionNewListAction() {
		return auctionNewListAction;
	}

	
}
