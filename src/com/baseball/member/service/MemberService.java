package com.baseball.member.service;

import java.util.Map;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MemberService {
	int registMember(MemberDetailDto memberdto);
	MemberDetailDto logIn(Map<String,String> map);
	int idCheck(String id);
	String idFind(MemberDto memberDto);
}
