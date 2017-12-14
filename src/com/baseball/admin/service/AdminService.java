package com.baseball.admin.service;

import java.util.List;
import java.util.Map;

import com.baseball.admin.model.NoticeDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.PageNavigation;

public interface AdminService {
	List<MemberDetailDto> listmember(Map<String,String> map);
	int writeNotice(Map<String,String> map);
	List<NoticeDto> noticeList();
	List<NoticeDto> noticeList(Map<String,String> map);
	NoticeDto viewNotice(int nno);
	int getNextSeq();
	PageNavigation makePageNavigation(int pg,String key, String word,int listsize);
}
