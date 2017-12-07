package com.baseball.member.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.member.model.MemberDto;
import com.baseball.member.service.MemberServiceImpl;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String path="/index.jsp";
		String root = request.getContextPath();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
//		System.out.println(id+""+pass);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pass", pass);
//		System.out.println(map.get("id"));
		MemberDto memberDto= MemberServiceImpl.getMemberService().logIn(map);
		if(memberDto!=null) {
			String idsv = request.getParameter("idsv");
			if("gksdjf".equals(memberDto.getId())) {
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", memberDto);
				path = "/admin/adhome.jsp";
			}else {
				if("saveid".equals(idsv)) {
					Cookie cookie = new Cookie("nid_sid",id);
					cookie.setPath(root);
					cookie.setMaxAge(60*60*24*365*50);
					response.addCookie(cookie);
				}else {
					Cookie cookie[] = request.getCookies();
					if(cookie!=null){
						int len = cookie.length;
						for(int i=0;i<len;i++){
							if("nid_sid".equals(cookie[i].getName())){
								cookie[i].setMaxAge(0);
//								cookie[i].setPath(root);
								response.addCookie(cookie[i]);
								break;
							}
						}
					}
				}
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", memberDto);
				path = "/index.jsp";
			}
		} else 
			path = "/index.jsp?id="+id;
		
		return path;
	}
	
}
