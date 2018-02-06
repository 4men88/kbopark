package com.baseball.mypage.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.baseball.action.Action;
import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.service.MemberServiceImpl;
import com.baseball.mypage.service.MypageServiceImpl;
import com.baseball.util.StringEncoder;

public class ModifyInfoAction implements Action {
	
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String path="/index.jsp";
      String id = request.getParameter("id");
      String pass = request.getParameter("pass");
    
      int cnt=0;
      MemberDetailDto memberDto = new MemberDetailDto();
      memberDto.setId(id);
      memberDto.setName(request.getParameter("name"));
      memberDto.setPass(pass);
      memberDto.setEmail1(request.getParameter("email1"));
      memberDto.setEmail2(request.getParameter("email2"));
      memberDto.setAddr1(request.getParameter("addr1"));
      memberDto.setAddr2(request.getParameter("addr2"));
      memberDto.setZip1(request.getParameter("zip1"));
      memberDto.setTno(Integer.parseInt(request.getParameter("tno")));
      memberDto.setTel1(request.getParameter("tel1"));
      memberDto.setTel2(request.getParameter("tel2"));
      memberDto.setTel3(request.getParameter("tel3"));

      cnt = MypageServiceImpl.getMypageService().modifyMember(memberDto);
      if(cnt!=0) {
    	 Map<String,String> map = new HashMap<String,String>();
    	 map.put("id",id);
    	 map.put("pass",pass);
         MemberDetailDto newMemberDto = MemberDaoImpl.getMemberDao().logIn(map);
         HttpSession session = request.getSession();
         session.setAttribute("userInfo", newMemberDto);
         path="/mypage/modifyinfo.jsp";
         System.out.println("modifyinfoAction>>>>>>>>>>잘하고있냐 성공");
      }else {
         System.out.println("modifyinfoAction>>>>>>>>>>잘하고있냐 실패");
         path="/index.jsp/////////fail";
      }
      return path;
   }

}