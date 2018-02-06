package com.baseball.myinfo.service;

import java.util.Map;

public interface KakaoApproveService {

	String getApproveInfo(Map<String, String> map);
	int updateRookie(String mid, int price);
	
}
