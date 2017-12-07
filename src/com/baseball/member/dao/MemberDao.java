package com.baseball.member.dao;

import java.util.Map;

import com.baseball.member.model.MemberDetailDto;

public interface MemberDao {
	int registMember(MemberDetailDto memberdto);
	MemberDetailDto logIn(Map<String,String> map);
	int idCheck(String id);
	String idFind(MemberDetailDto memberDetailDto);
}
