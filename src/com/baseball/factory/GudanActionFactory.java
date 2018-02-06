package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.gudan.action.*;

public class GudanActionFactory {

	private static Action gudanAction;
	private static Action stadiumAction;
	private static Action weeklyAction;
	private static Action timeAction;
	
	static {
		gudanAction = new GudanAction();
		stadiumAction = new StadiumAction();
		weeklyAction = new WeeklyAction();
		timeAction = new TimeAction();
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

	public static Action getTimeAction() {
		return timeAction;
	}

}
