package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.gudan.action.GudanAction;
import com.baseball.gudan.action.StadiumAction;

public class GudanActionFactory {

	private static Action gudanAction;
	private static Action stadiumAction;
	
	static {
		gudanAction = new GudanAction();
		stadiumAction = new StadiumAction();
	}

	public static Action getGudanAction() {
		return gudanAction;
	}

	public static Action getStadiumAction() {
		return stadiumAction;
	}
	
/*	private static Action boardWriteAction;

	static {
		boardWriteAction = new BoardWriteAction();
	}
	
	getta
*/
}
