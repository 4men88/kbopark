package com.baseball.admin.dao;

import java.util.List;
import java.util.Map;

import com.baseball.admin.model.NoticeDto;
import com.baseball.member.model.MemberDetailDto;

public interface AdminDao {

	List<MemberDetailDto> listmember(Map<String,String> map);
	void updatePen(String id,String type);
	void changestat(String id,int stat);
	int writeNotice(Map<String,String> map);
	List<NoticeDto> noticeList();
	List<NoticeDto> noticeList(Map<String,String> map);
	NoticeDto viewNotice(int nno);
	int getNextSeq();
	void updateHit(int seq);
	int getNewArticleCount();
	int getTotalArticleCount(Map<String,String> map);
}
