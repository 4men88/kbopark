package com.baseball.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.factory.MemberActionFactory;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.util.Constance;
import com.baseball.util.PageMove;


/**
 * Servlet implementation class MemberController
 */
@WebServlet("/kbopark")
public class MemberController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "/index.jsp";
		if("mvjoin".equals(act)){
			path="/member/join/join.jsp";
			PageMove.redirect(request, response, path);
		}else if("regist".equals(act)) {
			path=MemberActionFactory.getRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
//			System.out.println(path);
		}else if("mvlogin".equals(act)){
			path="/login/login.jsp";
			PageMove.redirect(request, response, path);
		}else if("idcheck".equals(act)){
			path=MemberActionFactory.getIdCheckAction().execute(request, response);
			PageMove.redirect(request, response, path);
		}else if("mvidck".equals(act)){
			path="/member/join/idcheck.jsp";
			PageMove.redirect(request, response, path);
		}else if("juso".equals(act)){
			path="/member/join/Popup.jsp";
			PageMove.redirect(request, response, path);
		}else if("mvfindid".equals(act)){
			path="/member/login/idfind.jsp";
			PageMove.redirect(request, response, path);
		}else if("mvfindpass".equals(act)){
			path="/member/login/pwdfind.jsp";
			PageMove.redirect(request, response, path);
		}else if("findid".equals(act)){
			System.out.println("아이디찾자");
			path=MemberActionFactory.getIdfindAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("login".equals(act)){
			path=MemberActionFactory.getLoginAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("logout".equals(act)){
			HttpSession session = request.getSession();
			session.removeAttribute("userinfo");
			session.invalidate();
			PageMove.redirect(request, response, "/index.jsp");
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constance.MAIN_ENCODING);
		doGet(request, response);
	}

}
