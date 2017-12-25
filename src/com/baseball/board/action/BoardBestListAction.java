package com.baseball.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.board.service.ReplyServiceImpl;

public class BoardBestListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int tno = Integer.parseInt(request.getParameter("tno"));
		List<BoardDto> bestlist = BoardServiceImpl.getBoardService().bestArticle(tno);
		System.out.println("BBestListAction listsize >> " + bestlist.size());

		request.setAttribute("bestlist", bestlist);
		return "/community/bestlist.jsp";
	}
}
