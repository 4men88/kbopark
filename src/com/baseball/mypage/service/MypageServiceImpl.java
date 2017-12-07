package com.baseball.mypage.service;

import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;


public class MypageServiceImpl implements MypageService {
	private static MypageService mypageService;
	
	static {
		
		mypageService = new MypageServiceImpl();
		
	}
	
	private MypageServiceImpl() {}
	
	public static MypageService getMypageService() {
		return mypageService;
	}
	
	
	
	
	
	@Override
	public int modifyMember(MemberDetailDto memberdto) {
		System.out.println("서비스임플로보낸당");
		return MypageDaoImpl.getMypageDao().registMember(memberdto);
	}

}
