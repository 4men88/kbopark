package com.baseball.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.util.NullCheck;

public class BoardViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	int seq = NullCheck.nullToZero(request.getParameter("seq"));
	if(seq != 0) {
		BoardDto boardDto = BoardServiceImpl.getBoardService().viewArticle(seq);
		
		request.setAttribute("article", boardDto);
	}
	return "/community/view.jsp";
	}

}