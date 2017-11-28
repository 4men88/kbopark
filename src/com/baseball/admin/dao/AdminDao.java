package com.baseball.admin.dao;

<<<<<<< HEAD
public interface AdminDao {

=======
import java.util.List;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface AdminDao {
	List<MemberDetailDto> getAllUser();
	List<MemberDetailDto> getSelectUser();
	
>>>>>>> 8b36bde3139e66a00f179ad9d416675ce0adedcf
}
