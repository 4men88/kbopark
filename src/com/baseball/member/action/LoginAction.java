package com.baseball.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.member.model.MemberDto;
import com.baseball.member.service.MemberServiceImpl;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String path="/wrongpath.jsp";
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		MemberDto memberDto= MemberServiceImpl.getMemberService().logIn(id,pass); 
		if(memberDto!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", memberDto);
			path = "login/loginok.jsp";
		}else {
			path="/login/loginfail.jsp";
		}
		return path;
	}
	
}
