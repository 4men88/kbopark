package com.baseball.admin.service;

import java.util.List;
import java.util.Map;

import com.baseball.admin.model.NoticeDto;
import com.baseball.admin.util.PageNavi;
import com.baseball.board.model.BoardDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.util.PageNavigation;

public interface AdminService {
	List<MemberDetailDto> listmember(Map<String,String> map);
	int writeNotice(Map<String,String> map);
	List<NoticeDto> noticeList(int ntype,int pg, String key, String word);
	NoticeDto viewNotice(int nno);
	int deleteNotice(int nno);
	int getNextSeq();
	PageNavi makePageNavigation(int ntype,int pg,String key, String word,int listsize);
	List<BoardDto> boardlist();
	List<NoticeDto> noticeList();
	List<ScheduleDto> getPlayToday();
}
