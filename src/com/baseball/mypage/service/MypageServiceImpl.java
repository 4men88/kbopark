package com.baseball.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baseball.board.dao.BoardDaoImpl;
import com.baseball.board.model.BoardDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.mypage.dao.MypageDaoImpl;
import com.baseball.util.Constance;


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
	public List<BoardDto> listArticle(MemberDetailDto memberDto) {
		System.out.println("������������������ �Ծ�>>>daoimpl �����");
		return MypageDaoImpl.getMypageDao().listArticle(memberDto);		
	}
	
	
	@Override
	public int modifyMember(MemberDetailDto memberDto) {
		System.out.println("mypageServiceImple>>>>>>>>>mypageDaoImpl.getMypageDao.modifyinfo ȣ��");
		return MypageDaoImpl.getMypageDao().modifyInfo(memberDto);
	}

	@Override
	public List<ReplyDto> listReply(MemberDetailDto memberDto) {
		System.out.println("������������������ �Ծ�>>>daoimpl �����");
		return MypageDaoImpl.getMypageDao().replyArticle(memberDto);	
	}

}
