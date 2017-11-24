package com.baseball.member.service;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MemberService {
	int registMember(MemberDetailDto memberdto);
	MemberDto logIn(MemberDto memberDto);
	int idCheck(String id);
	String idFind(MemberDetailDto memberDto);
}
