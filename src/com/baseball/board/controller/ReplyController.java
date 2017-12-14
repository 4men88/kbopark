package com.baseball.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.BoardActionFactory;
import com.baseball.util.Constance;
import com.baseball.util.PageMove;

@WebServlet("/reply")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String act = request.getParameter("act");
		System.out.println("ReplyController act >>> " + act);
		String path = "/index.jsp";
		if("writeReply".equals(act)) {
			path = BoardActionFactory.getReplyWriteAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if("listReply".equals(act)) {
			path = BoardActionFactory.getReplyListAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if("deleteReply".equals(act)) {
			path = BoardActionFactory.getReplyDeleteAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else {
			PageMove.redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
