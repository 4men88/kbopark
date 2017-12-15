package com.baseball.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.board.model.BoardDto;

public class ListBoardAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path="/index.jsp";
		List<BoardDto> list = AdminServiceImpl.getAdminService().boardlist();
		request.setAttribute("clist", list);
		path="/admin/board/admincmnt.jsp";
		return path;
	}

}
