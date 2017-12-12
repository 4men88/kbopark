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

public class ListNoticeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/index";
		List<NoticeDto> list=AdminServiceImpl.getAdminService().noticeList();
		if(list!=null) {
			System.out.println("list ¿÷¥Ÿ");
			request.setAttribute("notilist", list);
			path = "/admin/notice.jsp";
		}
		return path;
	}

}
