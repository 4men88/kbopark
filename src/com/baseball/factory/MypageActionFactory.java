package com.baseball.factory;



import com.baseball.mypage.action.ModifyInfoAction;

public class MypageActionFactory {

	
	private static ModifyInfoAction modifyInfoAction;
	private static MypageActionFactory mypageActionFactory;
	
	
	
	static {
		modifyInfoAction = new ModifyInfoAction();
		mypageActionFactory = new MypageActionFactory();
	}

	
	public static ModifyInfoAction getModifyInfoAction() {
		return modifyInfoAction;
	}


	public static MypageActionFactory getMypageActionFactory() {
		return mypageActionFactory;
	}
	
	
}