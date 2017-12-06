package com.baseball.factory;

import com.baseball.admin.action.UserListAction;

public class AdminActionFactory {
	private static UserListAction userListAction;
	
	static {
		
		userListAction = new UserListAction();
		
	}

	public static UserListAction getUserListAction() {
		return userListAction;
	}
	
	
}
