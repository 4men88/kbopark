package com.baseball.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baseball.admin.dao.AdminDaoImpl;
import com.baseball.admin.model.NoticeDto;
import com.baseball.admin.util.PageNavi;
import com.baseball.board.model.BoardDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.util.Constance;





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
	public List<NoticeDto> noticeList(int ntype, int pg, String key, String word) {
		int end = pg * Constance.BOARD_LIST_SIZE;
		int start = end - Constance.BOARD_LIST_SIZE;
		System.out.println("AdminServiceImpl==="+ntype+" "+pg+" "+key+" "+word);
		Map<String, String> map = new HashMap<String, String>();
		map.put("ntype", ntype + "");
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);
		return AdminDaoImpl.getAdminDao().noticeList(map);
	}




	@Override
	public NoticeDto viewNotice(int nno) {
		AdminDaoImpl.getAdminDao().updateHit(nno);
		return AdminDaoImpl.getAdminDao().viewNotice(nno);
	}

	@Override
	public int getNextSeq() {
		return AdminDaoImpl.getAdminDao().getNextSeq();
		
	}


	@Override
	public PageNavi makePageNavigation(int ntype,int pg, String key, String word, int listsize) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("ntype", ntype+"");
		map.put("key", key);
		map.put("word", word);
		
		PageNavi navigation = new PageNavi();
		int pgSize = Constance.PAGE_SIZE;
		navigation.setPageNo(pg);
		int newArticleCount = AdminDaoImpl.getAdminDao().getNewArticleCount();
		navigation.setNewArticleCount(newArticleCount);
		int totalArticleCount=AdminDaoImpl.getAdminDao().getTotalArticleCount(map);
		System.out.println(totalArticleCount);
		navigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount=(totalArticleCount-1)/listsize + 1;
		navigation.setTotalPageCount(totalPageCount);
		navigation.setNowFirst(pg<=pgSize);
		navigation.setNowEnd(pg>(totalPageCount-1)/pgSize*pgSize);
		return navigation;
	}



	@Override
	public List<BoardDto> boardlist() {
		return AdminDaoImpl.getAdminDao().boardlist();
	}



	@Override
	public List<NoticeDto> noticeList() {
		return AdminDaoImpl.getAdminDao().noticeList();
	}



	@Override
	public List<ScheduleDto> getPlayToday() {
		return AdminDaoImpl.getAdminDao().getPlayToday();
	}



	
}
