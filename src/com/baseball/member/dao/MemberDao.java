package com.baseball.member.dao;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MemberDao {
	int registMember(MemberDetailDto memberdto);
	MemberDto logIn(MemberDto memberDto);
	int idCheck(String id);
	String idFind(MemberDetailDto memberDto);
}
