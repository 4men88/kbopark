package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.myinfo.action.*;

public class MyinfoActionFactory {

	private static Action kakaoReadyAction;
	private static Action kakaoApproveAction;
	private static Action moveMyinfoAction;
	
	static {
		kakaoReadyAction = new KakaoReadyAction();
		kakaoApproveAction = new KakaoApproveAction();
		moveMyinfoAction = new MoveMyinfoAction();
	}

	public static Action getKakaoReadyAction() {
		return kakaoReadyAction;
	}

	public static Action getKakaoApproveAction() {
		return kakaoApproveAction;
	}

	public static Action getMoveMyinfoAction() {
		return moveMyinfoAction;
	}

	
}
