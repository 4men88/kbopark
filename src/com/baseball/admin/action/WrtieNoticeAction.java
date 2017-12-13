package com.baseball.admin.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;

public class WrtieNoticeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path="/admin/notice.jsp";
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String context = request.getParameter("context");
		String notitype =request.getParameter("notitype");
		System.out.println(notitype);
		Map<String,String> map = new HashMap<String,String>();
		map.put("writer", writer);
		map.put("subject", subject);
		map.put("context", context);
		map.put("notitype", notitype);
		int cnt = AdminServiceImpl.getAdminService().writeNotice(map);
		if(cnt!=0) {
			path="/admin?act=notice";
		}else {
			path="/index.jsp";
		}
		return path;
	}
	

}
