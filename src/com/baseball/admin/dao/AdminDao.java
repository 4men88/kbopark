package com.baseball.admin.dao;

import java.util.List;
import java.util.Map;

import com.baseball.member.model.MemberDetailDto;

public interface AdminDao {
	List<MemberDetailDto> getAllUser();
	List<MemberDetailDto> getSelectUser();
	List<MemberDetailDto> listmember(Map<String,String> map);
	void updatePen(String id,String type);
	void changestat(String id,int stat);
}
