package com.baseball.admin.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.baseball.action.Action;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.StringEncoder;

public class UserListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path="/index.jsp";
		System.out.println("¿¢¼Ç");
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		if(memberDto!=null) {
			if("gksdjf".equals(memberDto.getId())){
				String key=request.getParameter("key");
				String word = StringEncoder.isoToMain(request.getParameter("word"));
				System.out.println(key+"=k,w="+word);
				Map<String, String> map = new HashMap<String,String>();
				map.put("key", key);
				map.put("word", word);
				List<MemberDetailDto> list = AdminServiceImpl.getAdminService().listmember(map);
				System.out.println("list==="+list);
				request.setAttribute("mlist", list);
				path="/admin/mlistxml.jsp";
			}else {
				path="/admin/adhome.jsp";
				
			}
		}else {
			path="/index.jsp";
		}
		return path;
	}
		
}
