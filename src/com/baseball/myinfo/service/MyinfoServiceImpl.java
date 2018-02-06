package com.baseball.myinfo.service;

import com.baseball.myinfo.dao.MyinfoDaoImpl;

public class MyinfoServiceImpl implements MyinfoService {
	private static MyinfoService ms;
	
	static {
		ms = new MyinfoServiceImpl();
	}

	public static MyinfoService getMs() {
		return ms;
	}

	@Override
	public String getMyTname(int mtno) {
		return MyinfoDaoImpl.getMyinfoDao().getMyTname(mtno);
	}
	
	@Override
	public int getMyRookie(String mid) {
		return MyinfoDaoImpl.getMyinfoDao().getMyRookie(mid);
	}

	@Override
	public String getMyEmblem(int mtno) {
		return MyinfoDaoImpl.getMyinfoDao().getMyEmblem(mtno);
	}

}
