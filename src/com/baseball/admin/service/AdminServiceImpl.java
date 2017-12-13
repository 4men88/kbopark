package com.baseball.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baseball.admin.dao.AdminDaoImpl;
import com.baseball.admin.model.NoticeDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.util.Constance;
import com.baseball.util.PageNavigation;
import com.kitri.common.dao.CommonDaoImpl;
import com.kitri.util.BoardConstance;


public class AdminServiceImpl implements AdminService{
	private static AdminService adminService;
	
	static {
		
		adminService = new AdminServiceImpl();
		
	}
	
	private AdminServiceImpl() {}
	
	
	
	public static AdminService getAdminService() {
		return adminService;
	}


	@Override
	public List<MemberDetailDto> listmember(Map<String, String> map) {
		return AdminDaoImpl.getAdminDao().listmember(map);
	}



	@Override
	public int writeNotice(Map<String, String> map) {
		return AdminDaoImpl.getAdminDao().writeNotice(map);
	}



	@Override
	public List<NoticeDto> noticeList() {
		return AdminDaoImpl.getAdminDao().noticeList();
	}



	@Override
	public List<NoticeDto> noticeList(Map<String, String> map) {
		return AdminDaoImpl.getAdminDao().noticeList(map);
	}



	@Override
	public NoticeDto viewNotice(int nno) {
		return AdminDaoImpl.getAdminDao().viewNotice(nno);
	}

	@Override
	public int getNextSeq() {
		return AdminDaoImpl.getAdminDao().getNextSeq();
	}

	@Override
	public PageNavigation makePageNavigation(int pg, String key, String word, int listsize) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("key", key+"");
		map.put("word", word+"");
		
		PageNavigation navigation = new PageNavigation();
		int pgSize = Constance.PAGE_SIZE;
		navigation.setPageNo(pg);
		int newArticleCount = AdminDaoImpl.getAdminDao().getNewArticleCount();
		navigation.setNewArticleCount(newArticleCount);
		int totalArticleCount=AdminDaoImpl.getAdminDao().getTotalArticleCount(map);
		navigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount=(totalArticleCount-1)/listsize + 1;
		navigation.setTotalPageCount(totalPageCount);
		navigation.setNowFirst(pg<=pgSize);
		navigation.setNowEnd(pg>(totalPageCount-1)/pgSize*pgSize);
		return navigation;
	}

}
