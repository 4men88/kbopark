package com.baseball.myinfo.dao;

public class MyinfoDaoImpl implements MyinfoDao {

	private static MyinfoDao myinfoDao;
	
	static {
		myinfoDao = new MyinfoDaoImpl();
	}
	
	private MyinfoDaoImpl() {
	}

	public static MyinfoDao getMyinfoDao() {
		return myinfoDao;
	}


	@Override
	public int updateRookie(int price) {
		//��Ű��������Ʈ!
		
		
		return 0;
	}

}
