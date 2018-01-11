package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.myinfo.action.KakaoApproveAction;
import com.baseball.myinfo.action.KakaoReadyAction;

public class MyinfoActionFactory {

	private static Action kakaoReadyAction;
	private static Action kakaoApproveAction;
	
	static {
		kakaoReadyAction = new KakaoReadyAction();
		kakaoApproveAction = new KakaoApproveAction();
	}

	public static Action getKakaoReadyAction() {
		return kakaoReadyAction;
	}

	public static Action getKakaoApproveAction() {
		return kakaoApproveAction;
	}
	
}
