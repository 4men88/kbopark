package com.baseball.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public class UserListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path="/index.jsp";
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		if(memberDto!=null) {
			if("gksdjf".equals(memberDto.getId())){
				List<MemberDetailDto> list = AdminServiceImpl.getAdminService().getAllUser();
				request.setAttribute("userList", list);
				System.out.println("id"+list.get(1).getId());
				System.out.println("name"+list.get(1).getName());
				System.out.println("roo"+list.get(1).getRookie());
				System.out.println("pe"+list.get(1).getPenalty());
				System.out.println("ms"+list.get(1).getMstatus());
				path="/admin/adminuser.jsp";
			}else {
				path="/admin/adhome.jsp";
				
			}
		}else {
			path="/index.jsp";
		}
		return path;
	}
		
}
