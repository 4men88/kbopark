package com.baseball.admin.dao;

import java.util.List;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface AdminDao {
	List<MemberDetailDto> getAllUser();
	List<MemberDetailDto> getSelectUser();
	
}
