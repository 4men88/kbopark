package com.baseball.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.factory.BoardActionFactory;
import com.baseball.util.NullCheck;

public class BoardDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = "";
		//�۹�ȣ�� ���������� ������, ���������� ��
		int seq = NullCheck.nullToZero(request.getParameter("seq"));
		if(seq != 0) {
			int cnt = BoardServiceImpl.getBoardService().deleteArticle(seq);
			if(cnt != 0) {
				path = BoardActionFactory.getBoardListAction().execute(request, response);
			} else {
				path = "/index.jsp";
			}
		}		
		
		System.out.println("BoardDeleteAction ����path >>> " + path);
		return path;
	}
}