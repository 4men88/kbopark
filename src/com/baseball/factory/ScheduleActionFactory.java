package com.baseball.factory;

import com.baseball.schedule.action.MonthlyAction;
import com.baseball.schedule.action.ScheduleAction;

public class ScheduleActionFactory {

	
	private static ScheduleAction scheduleAction;
	private static MonthlyAction monthlyAction;
	
	static {
		scheduleAction = new ScheduleAction();
		monthlyAction = new MonthlyAction();
		
	}

	public static ScheduleAction getScheduleAction() {
		return scheduleAction;
	}

	public static MonthlyAction getMonthlyAction() {
		return monthlyAction;
	}
	
	
}
