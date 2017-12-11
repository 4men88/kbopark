package com.baseball.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;

public class ReplyWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
/*package com.kitri.memo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.kitri.action.Action;
import com.kitri.board.model.MemoDto;
import com.kitri.board.service.MemoServiceImpl;
import com.kitri.member.model.MemberDto;

public class MemoWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			MemoDto memoDto = new MemoDto();
			memoDto.setSeq(seq);
			memoDto.setId(memberDto.getId());
			memoDto.setName(memberDto.getName());
			memoDto.setMcontent(request.getParameter("mcontent"));
//			System.out.println(">>>>>>>>>>>>>>>" + request.getParameter("mcontent"));
			MemoServiceImpl.getMemoService().writeMemo(memoDto);
			List<MemoDto> list = MemoServiceImpl.getMemoService().listMemo(seq);
//			System.out.println("¸Þ¸ð±Û °¹¼ö : " + list.size());
			request.setAttribute("memolist", list);
		}
		return "/memo/list.jsp";
	}

}
*/