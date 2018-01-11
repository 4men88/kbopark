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
		System.out.println("GudanController act >>> " + act);
//		int tno = NullCheck.nullToZero(request.getParameter("tno"));
		String path = "/index.jsp";
		
		if("mvmyinfo".equals(act)) {
			
		} else if("chargerookie".equals(act)) {
			path = MyinfoActionFactory.getKakaoReadyAction().execute(request, response);
			response.sendRedirect(path);
			
		} else if ("finrookie".equals(act)) {
			System.out.println("Kakaopay fin ¡¯¿‘!");
			path = MyinfoActionFactory.getKakaoApproveAction().execute(request, response);
			PageMove.forward(request, response, path);

		}
		else if("".equals(act)) {
			PageMove.redirect(request, response, path);
		}

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
