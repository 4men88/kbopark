package com.baseball.myinfo.dao;

public interface MyinfoDao {

	int updateRookie(String mid, int price);
	String getMyTname(int mtno);
	String getMyEmblem(int mtno);
	int getMyRookie(String mid);
}
