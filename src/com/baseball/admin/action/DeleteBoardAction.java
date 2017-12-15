package com.baseball.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.dao.BoardDaoImpl;
import com.baseball.board.service.BoardServiceImpl;

public class DeleteBoardAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("bno"));
		int cnt = BoardDaoImpl.getBoardDao().deleteArticle(seq);
		String path = "/admin/board/delboard.jsp?cnt="+cnt;
		return path;
	}

}
