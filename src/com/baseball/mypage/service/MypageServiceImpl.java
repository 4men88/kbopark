package com.baseball.mypage.service;

import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.mypage.dao.MypageDaoImpl;


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
	public int modifyMember(MemberDetailDto memberDto) {
		System.out.println("mypageServiceImple>>>>>>>>>mypageDaoImpl.getMypageDao.modifyinfo »£√‚");
		return MypageDaoImpl.getMypageDao().modifyInfo(memberDto);
	}

}
