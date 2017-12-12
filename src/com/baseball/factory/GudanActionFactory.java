package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.gudan.action.GudanAction;

public class GudanActionFactory {

	private static Action gudanAction;
	
	static {
		gudanAction = new GudanAction();
	}

	public static Action getGudanAction() {
		return gudanAction;
	}
	
/*	private static Action boardWriteAction;

	static {
		boardWriteAction = new BoardWriteAction();
	}
	
	getta
*/
}
