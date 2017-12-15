package com.baseball.admin.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.model.NoticeDto;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.admin.util.PageNavi;
import com.baseball.util.Constance;
import com.baseball.util.NullCheck;
import com.baseball.util.PageNavigation;
import com.baseball.util.StringEncoder;


public class ListNoticeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/index";
		int ntype = NullCheck.nullToZero(request.getParameter("ntype"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		System.out.println("ListNotice Action==="+ntype+"  "+pg+"  "+key+"  "+word);
		List<NoticeDto> list=AdminServiceImpl.getAdminService().noticeList(ntype, pg, key, word);
		PageNavi navigation = AdminServiceImpl.getAdminService().makePageNavigation(ntype, pg, key, word,Constance.BOARD_LIST_SIZE);
		navigation.setRoot(request.getContextPath());
		navigation.setNtype(ntype);
		navigation.setKey(key);
		navigation.setWord(word);
		navigation.setNavigator();
		
		request.setAttribute("notilist", list);
		request.setAttribute("navigator", navigation);
		return "/admin/notice/notice.jsp";
	}

}
