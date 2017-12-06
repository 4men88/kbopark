package com.baseball.factory;

import com.baseball.member.action.IdCheckAction;
import com.baseball.member.action.IdFindAction;
import com.baseball.member.action.LoginAction;
import com.baseball.member.action.RegisterAction;

public class MemberActionFactory {
	private static RegisterAction registerAction;
	private static LoginAction	loginAction;
	private static IdCheckAction idCheckAction;
	private static IdFindAction idfindAction;
	static {
		registerAction = new RegisterAction();
		loginAction = new LoginAction();
		idCheckAction = new IdCheckAction();
		idfindAction = new IdFindAction();
	}

	public static LoginAction getLoginAction() {
		return loginAction;
	}

	public static RegisterAction getRegisterAction() {
		return registerAction;
	}

	public static IdCheckAction getIdCheckAction() {
		return idCheckAction;
	}

	public static IdFindAction getIdfindAction() {
		return idfindAction;
	}
}
