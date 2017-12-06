package com.baseball.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.factory.MemberActionFactory;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.service.MemberServiceImpl;
import com.baseball.util.Constance;
import com.baseball.util.PageMove;


@WebServlet("/kbopark")
public class MemberController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "/index.jsp";
		if("mvjoin".equals(act)){ //회원가입 버튼을 눌렀을 때
			path="/join/join.jsp";
			PageMove.redirect(request, response, path);

		}else if("regist".equals(act)) {//가입완료 번튼을 눌렀을때
			System.out.println("회원가입");
			path=MemberActionFactory.getRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);

		}else if("mvlogin".equals(act)){ //로그인 화면으로 갈때
			path="/login/login.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("idcheck".equals(act)){ // 아이디 중복검사
			String id = request.getParameter("id");
			System.out.println(id);
			int idcount = MemberServiceImpl.getMemberService().idCheck(id);
			System.out.println(idcount);
			response.setContentType("text/plain;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print(idcount+","+id);
		
		}else if("mvidck".equals(act)){ //아이디 중복검사창으로 이동
			path="/join/idcheck.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("juso".equals(act)){ //다음 주소API 사용(팝업창띄우기)
			path="/join/Popup.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("mvfindid".equals(act)){ //아이디 찾기 창으로 이동
			path="/login/findid.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("mvfindpass".equals(act)){ //비밀번호 찾기창으로 이동
			path="/login/pwdfind.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("findid".equals(act)){ // 아이디 찾기
			System.out.println("아이디찾자");
			path=MemberActionFactory.getIdfindAction().execute(request, response);
			PageMove.forward(request, response, path);
		
		}else if("login".equals(act)){ //로그인
			path=MemberActionFactory.getLoginAction().execute(request, response);
			PageMove.forward(request, response, path);
		
		}else if("logout".equals(act)){ //로그아웃
			HttpSession session = request.getSession();
			session.removeAttribute("userinfo");
			session.invalidate(); //세션 삭제로직
			PageMove.redirect(request, response, "/index.jsp");
		
		}else if("mypage".equals(act)){
			path="/mypage/mypageMain.jsp";
			PageMove.redirect(request, response, path);
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
