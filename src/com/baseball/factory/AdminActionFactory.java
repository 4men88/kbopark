package com.baseball.factory;

import com.baseball.admin.action.DeleteBoardAction;
import com.baseball.admin.action.ListBoardAction;
import com.baseball.admin.action.ListNoticeAction;
import com.baseball.admin.action.MainScheduleAction;
import com.baseball.admin.action.UserListAction;
import com.baseball.admin.action.ViewNoticeAction;
import com.baseball.admin.action.WrtieNoticeAction;

public class AdminActionFactory {
	private static UserListAction userListAction;
	private static WrtieNoticeAction writeNoticeAction;
	private static ListNoticeAction listNoticeAction;
	private static ListBoardAction listBoardAction;
	private static ViewNoticeAction viewNoticeAction;
	private static DeleteBoardAction deleteBoardAction;
	private static MainScheduleAction mainScheduleAction;
	static {
		
		userListAction = new UserListAction();
		writeNoticeAction = new WrtieNoticeAction();
		listNoticeAction = new ListNoticeAction();
		listBoardAction = new ListBoardAction();
		viewNoticeAction = new ViewNoticeAction();
		deleteBoardAction = new DeleteBoardAction();
		mainScheduleAction = new MainScheduleAction();
	}

	public static ViewNoticeAction getViewNoticeAction() {
		return viewNoticeAction;
	}

	public static UserListAction getUserListAction() {
		return userListAction;
	}

	public static WrtieNoticeAction getWriteNoticeAction() {
		return writeNoticeAction;
	}

	public static ListNoticeAction getListNoticeAction() {
		return listNoticeAction;
	}

	public static ListBoardAction getListBoardAction() {
		return listBoardAction;
	}

	public static DeleteBoardAction getDeleteBoardAction() {
		return deleteBoardAction;
	}

	public static MainScheduleAction getMainScheduleAction() {
		return mainScheduleAction;
	}


	
	
}
