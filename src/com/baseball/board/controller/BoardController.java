package com.baseball.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.BoardActionFactory;
import com.baseball.factory.GudanActionFactory;
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
		
		int tno = NullCheck.nullToZero(request.getParameter("tno"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		
		String queryString = "?tno=" + tno + "&pg=" + pg + "&key=" + key + "&word=" + StringEncoder.urlFormat(word);
		System.out.println("BoardController queryString >>> " + queryString);
		
		String path = "/index.jsp";
		if("mvwrite".equals(act)) {
			path = "/community/write.jsp" + queryString;
			PageMove.redirect(request, response, path);
		} else if("newarticle".equals(act)) {
			path = BoardActionFactory.getBoardWriteAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("viewarticle".equals(act)) {
			path = BoardActionFactory.getBoardViewAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("listarticle".equals(act)) {
			path = BoardActionFactory.getBoardListAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
			
		} else if("movemodify".equals(act)) {
			System.out.println("controller movemodify 진입 !");
			path = BoardActionFactory.getBoardMoveModifyAction().execute(request, response);
			path += queryString;
			System.out.println("controller movemodify path >>> " + path);
			PageMove.forward(request, response, path);
		} else if("modifyarticle".equals(act)) {
			System.out.println("controller modifyarticle 진입 !");		
			path = BoardActionFactory.getBoardModifyAction().execute(request, response);
			path += queryString;
			System.out.println("controller modifyarticle path >>>   " + path);
			PageMove.forward(request, response, path);
		} else if("deletearticle".equals(act)) {
			System.out.println("controller deletearticle 진입 !");
			path = BoardActionFactory.getBoardDeleteAction().execute(request, response);
			path += queryString;
			System.out.println("controller deletearticle path >>>   " + path);
			PageMove.forward(request, response, path);
			
		} else if("notifyarticle".equals(act)) {
			path = BoardActionFactory.getBoardNotifyAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
			
		} else if("prevarticle".equals(act)) {
			path = BoardActionFactory.getBoardPrevAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
		} else if("nextarticle".equals(act)) {
			path = BoardActionFactory.getBoardNextAction().execute(request, response);
			path += queryString;
			PageMove.forward(request, response, path);
			
		} else if("".equals(act)) {
			
		} else {
			PageMove.redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constance.MAIN_ENCODING);
		doGet(request, response);
	}

}
