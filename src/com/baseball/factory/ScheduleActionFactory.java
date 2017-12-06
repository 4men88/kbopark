package com.baseball.factory;

import com.baseball.schedule.action.ScheduleAction;

public class ScheduleActionFactory {

	
	private static ScheduleAction scheduleAction;
	
	static {
		scheduleAction = new ScheduleAction();
		
	}

	public static ScheduleAction getScheduleAction() {
		return scheduleAction;
	}
	
}
