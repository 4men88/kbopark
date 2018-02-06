package com.baseball.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;

public class DeleteNoticeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		System.out.println(nno);
		int cnt = AdminServiceImpl.getAdminService().deleteNotice(nno);
		String path = "/admin/notice/delresult.jsp?cnt="+cnt;
		
		return path;
	}

}
