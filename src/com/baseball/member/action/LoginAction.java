package com.baseball.member.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
//		System.out.println(id+""+pass);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pass", pass);
//		System.out.println(map.get("id"));
		MemberDto memberDto= MemberServiceImpl.getMemberService().logIn(map);
		System.out.println(memberDto.getEmail1());
		if(memberDto!=null) {
			if("gksdjf".equals(memberDto.getId())) {
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", memberDto);
				path = "/admin/adhome.jsp";
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", memberDto);
				path = "/index.jsp";
			}
		}else {
			path = "/login/loginfail.jsp";
		}
		return path;
	}
	
}
