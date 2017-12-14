package com.baseball.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.MypageActionFactory;
import com.baseball.util.NullCheck;
import com.baseball.util.PageMove;
import com.baseball.util.StringEncoder;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("MypageController  act === " + act);
		
		int tno = NullCheck.nullToZero(request.getParameter("tno"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("mid"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		
		String queryString = "?tno=" + tno + "&pg=" + pg + "&key=" + key + "&word=" + StringEncoder.urlFormat(word);
		System.out.println("BoardController queryString >>> " + queryString);
		
		
		
		String path = "/index.jsp";

		if ("mvmypage".equals(act)) {
			path = MypageActionFactory.getMypageMainAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if ("mypage".equals(act)) {
			
		} else if ("movemodify".equals(act)) {
			path = "/mypage/modifyinfo.jsp";
			PageMove.redirect(request, response, path);
		} else if ("modifyInfo".equals(act)) {
			System.out.println("mypageController >>> modifyInfo>>>mypageActionF.modifyinfoact.execu");
			path = MypageActionFactory.getModifyInfoAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if ("lookie".equals(act)) {

			PageMove.forward(request, response, path);
		} else if ("myarticle".equals(act)) {

			PageMove.forward(request, response, path);
		} else if ("".equals(act)) {

			PageMove.forward(request, response, path);
		} else {
			PageMove.redirect(request, response, path);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
