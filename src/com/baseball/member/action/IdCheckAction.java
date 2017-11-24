package com.baseball.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.member.service.MemberServiceImpl;

public class IdCheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int cnt = MemberServiceImpl.getMemberService().idCheck(id);
		String path="/member/join/idcheck.jsp?id="+id+"&cnt="+cnt;
		return path;
	}

}
