package com.baseball.member.service;

import java.util.Map;

import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public class MemberServiceImpl implements MemberService {
	private static MemberService memberService;
	
	static {
		
		memberService = new MemberServiceImpl();
		
	}
	
	private MemberServiceImpl() {}
	
	public static MemberService getMemberService() {
		return memberService;
	}

	@Override
	public int registMember(MemberDetailDto memberdto) {
		System.out.println("서비스임플로보낸당");
		return MemberDaoImpl.getMemberDao().registMember(memberdto);
		
	}



	@Override
	public int idCheck(String id) {
		return MemberDaoImpl.getMemberDao().idCheck(id);
	}

	@Override
	public String idFind(MemberDetailDto memberDto) {
		return MemberDaoImpl.getMemberDao().idFind(memberDto);
	}



	@Override
	public MemberDto logIn(Map<String, String> map) {
		
		return MemberDaoImpl.getMemberDao().logIn(map);
	}

}
