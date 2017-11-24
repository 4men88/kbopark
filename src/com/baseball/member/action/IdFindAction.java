package com.baseball.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.service.MemberServiceImpl;

public class IdFindAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		MemberDetailDto memberDto = new MemberDetailDto();
		memberDto.setName("fname");
		memberDto.setEmail1("email1");
		memberDto.setEmail2("email2");
		String fid = MemberServiceImpl.getMemberService().idFind(memberDto);
		String path="/member/login/idfind.jsp?fid="+fid;
		
		return path;
	}
}
