package com.baseball.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;

public class BoardMoveModifyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("BoardMoveModifyAction seq >>> " + seq);
			
		BoardDto boardDto = BoardServiceImpl.getBoardService().viewArticle(seq);			
		request.setAttribute("parentarticle", boardDto);		
		
		/*원글 글제목, 글내용, 글번호, 그룹번호 등 등 다 가져가야함*/
		return "/community/modify.jsp";
	}

}