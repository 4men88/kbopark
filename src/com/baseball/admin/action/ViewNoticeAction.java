package com.baseball.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.model.NoticeDto;
import com.baseball.admin.service.AdminServiceImpl;

public class ViewNoticeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/index.jsp";
		int nno = Integer.parseInt(request.getParameter("nno"));
		System.out.println(nno);
		NoticeDto noticeDto = AdminServiceImpl.getAdminService().viewNotice(nno);
		if(noticeDto!=null) {
			request.setAttribute("viewnotice", noticeDto);
			path="/admin/viewnotice.jsp";
		}
		return path;
	}

}
