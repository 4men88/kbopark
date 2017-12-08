package com.baseball.factory;

import com.baseball.admin.action.UserListAction;
import com.baseball.admin.action.WrtieNoticeAction;

public class AdminActionFactory {
	private static UserListAction userListAction;
	private static WrtieNoticeAction writeNoticeAction;
	static {
		
		userListAction = new UserListAction();
		writeNoticeAction = new WrtieNoticeAction();
	}

	public static UserListAction getUserListAction() {
		return userListAction;
	}

	public static WrtieNoticeAction getWriteNoticeAction() {
		return writeNoticeAction;
	}
	
	
}
