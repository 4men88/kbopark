package com.baseball.myinfo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.baseball.factory.MyinfoActionFactory;
import com.baseball.util.PageMove;

@WebServlet("/myinfo")
public class MyinfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "/index.jsp";
		
		if("mvmyinfo".equals(act)) {
			path = MyinfoActionFactory.getMoveMyinfoAction().execute(request, response);
			PageMove.forward(request, response, path);
			
		} else if("mvpay".equals(act)) {
			PageMove.redirect(request, response, "/myinfo/paycharge.jsp");
			
		} else if("chargerookie".equals(act)) {
			path = MyinfoActionFactory.getKakaoReadyAction().execute(request, response);
			response.sendRedirect(path);
			
		} else if ("finrookie".equals(act)) {
			System.out.println("Kakaopay fin ¡¯¿‘!");
			path = MyinfoActionFactory.getKakaoApproveAction().execute(request, response);
			PageMove.forward(request, response, path);

		} else if("failrookie".equals(act)) {
			PageMove.redirect(request, response, "/myinfo/chargefail.jsp");
		} else if("cancelrookie".equals(act)) {
			PageMove.redirect(request, response, "/myinfo/chargecancel.jsp");
			
		} else if("".equals(act)) {
			PageMove.redirect(request, response, path);
		} 
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
