package com.baseball.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.service.MemberServiceImpl;

public class RegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String path="/index.jsp";
		MemberDetailDto memberdto = new MemberDetailDto();
		memberdto.setId(request.getParameter("id"));
		memberdto.setName(request.getParameter("name"));
		memberdto.setPass(request.getParameter("pass"));
		memberdto.setEmail1(request.getParameter("email1"));
		memberdto.setEmail2(request.getParameter("email2"));
		memberdto.setAddr1(request.getParameter("addr1"));
		memberdto.setAddr2(request.getParameter("addr2"));
		memberdto.setZip1(request.getParameter("zip1"));
		memberdto.setZip2(request.getParameter("zip2"));
		memberdto.setTel1(request.getParameter("tel1"));
		memberdto.setTel2(request.getParameter("tel2"));
		memberdto.setTel3(request.getParameter("tel3"));
		int cnt = MemberServiceImpl.getMemberService().registMember(memberdto);
		if(cnt!=0) {
			request.setAttribute("registInfo", memberdto);
			path="/member/join/joinok.jsp";
		}else {
			System.out.println(cnt);
			path="/member/join/joinfail.jsp";
		}
		return path;
	}

}
