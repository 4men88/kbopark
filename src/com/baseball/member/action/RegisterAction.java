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
//		System.out.println(request.getParameter("id"));
//		String tno = request.getParameter("tno");
//		System.out.println(tno);
//		System.out.println(request.getParameter("name"));
//		System.out.println(request.getParameter("pass"));
//		System.out.println(request.getParameter("email1"));
//		System.out.println(request.getParameter("email2"));
//		System.out.println(request.getParameter("addr1"));
//		System.out.println(request.getParameter("addr2"));
//		System.out.println(request.getParameter("zip1"));
//		System.out.println(Integer.parseInt(tno));
//		System.out.println(request.getParameter("tel1"));
//		System.out.println(request.getParameter("tel2"));
		
		MemberDetailDto memberdto = new MemberDetailDto();
		memberdto.setId(request.getParameter("id"));
		memberdto.setName(request.getParameter("name"));
		memberdto.setPass(request.getParameter("pass"));
		memberdto.setEmail1(request.getParameter("email1"));
		memberdto.setEmail2(request.getParameter("email2"));
		memberdto.setAddr1(request.getParameter("addr1"));
		memberdto.setAddr2(request.getParameter("addr2"));
		memberdto.setZip1(request.getParameter("zip1"));
		memberdto.setTno(Integer.parseInt(request.getParameter("tno")));
		memberdto.setTel1(request.getParameter("tel1"));
		memberdto.setTel2(request.getParameter("tel2"));
		memberdto.setTel3(request.getParameter("tel3"));

		int cnt = MemberServiceImpl.getMemberService().registMember(memberdto);
		request.setAttribute("registInfo", memberdto);
		path="/join/joinresult.jsp?cnt="+cnt;
		
		
		
		return path;
	}

}
