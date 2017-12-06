package com.baseball.admin.service;

import java.util.List;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface AdminService {
	List<MemberDetailDto> getAllUser();
	List<MemberDetailDto> getSelectUser();
}
