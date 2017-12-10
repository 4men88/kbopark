package com.baseball.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.BoardActionFactory;
import com.baseball.util.Constance;
import com.baseball.util.NullCheck;
import com.baseball.util.PageMove;
import com.baseball.util.StringEncoder;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("BoardController act >>> " + act);
		
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		
		String queryString = "?pg=" + pg + "&key=" + key + "&word=" + StringEncoder.urlFormat(word);
		System.out.println("BoardController queryString >>> " + queryString);
		
		String path = "/index.jsp";
		
		if("mvwrite".equals(act)) {
			path = "/board/write.jsp" + queryString;
			PageMove.redirect(request, response, path);
		} else if("newarticle".equals(act)) {
			path = BoardActionFactory.getBoardWriteAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("viewarticle".equals(act)) {
			path = BoardActionFactory.getBoardViewAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		/*} else if("listarticle".equals(act)) {
			path = BoardActionFactory.getReboardListAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("mvreply".equals(act)) {
			path = BoardActionFactory.getReboardMoveReplyAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("replyarticle".equals(act)) {
			path = BoardActionFactory.getReboardReplyAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			*/
		} else {
			PageMove.redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constance.MAIN_ENCODING);
		doGet(request, response);
	}

}
