package com.baseball.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.factory.MemberActionFactory;
import com.baseball.factory.MypageActionFactory;
import com.baseball.util.PageMove;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("ReboardController  act === " + act);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String path = "/index.jsp";
		
		if("mypageMain".equals(act)) {
			path = "/reboard/write.jsp" ;
			PageMove.redirect(request, response, path);
		} else if("mypage".equals(act)) {
			
		} else if("movemodify".equals(act)) {
			path = "/mypage/modifyinfo.jsp";
			PageMove.redirect(request, response, path);
		} else if("modifyInfo".equals(act)) {
			System.out.println("mypageController >>> modifyInfo>>>mypageActionF.modifyinfoact.execu");
			path=MypageActionFactory.getModifyInfoAction().execute(request, response);
			PageMove.forward(request, response, path);
		} else if("lookie".equals(act)) {
			
			PageMove.forward(request, response, path);
		}  else if("myarticle".equals(act)) {
			
			PageMove.forward(request, response, path);
		}else if("".equals(act)) {
		
			PageMove.forward(request, response, path);
		}else {
			PageMove.redirect(request, response, path);
		}
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
