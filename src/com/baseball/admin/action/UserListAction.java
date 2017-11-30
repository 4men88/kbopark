package com.baseball.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.member.model.MemberDetailDto;

public class UserListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<MemberDetailDto> list = AdminServiceImpl.getAdminService().getAllUser();
		request.setAttribute("userList", list);
		System.out.println("id"+list.get(1).getId());
		System.out.println("name"+list.get(1).getName());
		System.out.println("roo"+list.get(1).getRookie());
		System.out.println("pe"+list.get(1).getPenalty());
		System.out.println("ms"+list.get(1).getMstatus());
		return "/admin/adminuser.jsp";
	}

}
