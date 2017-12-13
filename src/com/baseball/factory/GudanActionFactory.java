package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.gudan.action.*;

public class GudanActionFactory {

	private static Action gudanAction;
	private static Action stadiumAction;
	private static Action weeklyAction;
	
	static {
		gudanAction = new GudanAction();
		stadiumAction = new StadiumAction();
		weeklyAction = new WeeklyAction();
	}

	public static Action getGudanAction() {
		return gudanAction;
	}

	public static Action getStadiumAction() {
		return stadiumAction;
	}

	public static Action getWeeklyAction() {
		return weeklyAction;
	}
	
/*	private static Action boardWriteAction;

	static {
		boardWriteAction = new BoardWriteAction();
	}
	
	getta
*/
}
