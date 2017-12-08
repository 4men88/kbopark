package com.baseball.factory;



import com.baseball.mypage.action.ModifyInfoAction;

public class MypageActionFactory {

	private static ModifyInfoAction modifyInfoAction;

	static {
		modifyInfoAction = new ModifyInfoAction();

	}

	
	public static ModifyInfoAction getModifyInfoAction() {
		return modifyInfoAction;
	}

	
	
}
