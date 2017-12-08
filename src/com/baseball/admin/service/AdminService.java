package com.baseball.admin.service;

import java.util.List;
import java.util.Map;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface AdminService {
	List<MemberDetailDto> getAllUser();
	List<MemberDetailDto> getSelectUser();
	List<MemberDetailDto> listmember(Map<String,String> map);
	int writeNotice(Map<String,String> map);
}
