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

public class NtypeListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = "/index";
		String ntype = request.getParameter("ntype");
		Map<String,String> map = new HashMap<String,String>(); 
		map.put("ntype", ntype);
		List<NoticeDto> list=AdminServiceImpl.getAdminService().noticeList(map);
		if(list!=null) {
			System.out.println("list ¿÷¥Ÿ");
			request.setAttribute("notilist", list);
			path = "/admin/notice.jsp";
		}
		return path;
	}

}

