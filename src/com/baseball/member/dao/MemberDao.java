package com.baseball.member.dao;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MemberDao {
	int registMember(MemberDetailDto memberdto);
	MemberDto logIn(String id,String pass);
	int idCheck(String id);
	String idFind(MemberDetailDto memberDto);
}
