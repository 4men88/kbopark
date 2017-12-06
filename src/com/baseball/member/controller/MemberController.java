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
		if("mvjoin".equals(act)){ //ȸ������ ��ư�� ������ ��
			path="/join/join.jsp";
			PageMove.redirect(request, response, path);

		}else if("regist".equals(act)) {//���ԿϷ� ��ư�� ��������
			System.out.println("ȸ������");
			path=MemberActionFactory.getRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);

		}else if("mvlogin".equals(act)){ //�α��� ȭ������ ����
			path="/login/login.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("idcheck".equals(act)){ // ���̵� �ߺ��˻�
			String id = request.getParameter("id");
			System.out.println(id);
			int idcount = MemberServiceImpl.getMemberService().idCheck(id);
			System.out.println(idcount);
			response.setContentType("text/plain;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print(idcount+","+id);
		
		}else if("mvidck".equals(act)){ //���̵� �ߺ��˻�â���� �̵�
			path="/join/idcheck.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("juso".equals(act)){ //���� �ּ�API ���(�˾�â����)
			path="/join/Popup.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("mvfindid".equals(act)){ //���̵� ã�� â���� �̵�
			path="/login/findid.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("mvfindpass".equals(act)){ //��й�ȣ ã��â���� �̵�
			path="/login/pwdfind.jsp";
			PageMove.redirect(request, response, path);
		
		}else if("findid".equals(act)){ // ���̵� ã��
			System.out.println("���̵�ã��");
			path=MemberActionFactory.getIdfindAction().execute(request, response);
			PageMove.forward(request, response, path);
		
		}else if("login".equals(act)){ //�α���
			path=MemberActionFactory.getLoginAction().execute(request, response);
			PageMove.forward(request, response, path);
		
		}else if("logout".equals(act)){ //�α׾ƿ�
			HttpSession session = request.getSession();
			session.removeAttribute("userinfo");
			session.invalidate(); //���� ��������
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
