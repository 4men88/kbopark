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
		String path="/member/login/login.jsp";
		MemberDto memberDto = new MemberDto();
		memberDto.setId("id");
		memberDto.setPass("pass");
		MemberDto memberDto1= MemberServiceImpl.getMemberService().logIn(memberDto); 
		if(memberDto1!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", memberDto1);
			path = "/common/header-white.jsp";
		}
		return path;
	}
	
}
