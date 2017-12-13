package com.baseball.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.board.model.ReplyDto;
import com.baseball.board.service.ReplyServiceImpl;
import com.baseball.member.model.MemberDto;

public class ReplyWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			ReplyDto replyDto = new ReplyDto();
			replyDto.setBno(seq);
			replyDto.setMid(memberDto.getId());
			replyDto.setReplyname(memberDto.getName());
			replyDto.setRecontent(request.getParameter("recontent"));
			System.out.println("ReplyWriteAction >>> " + request.getParameter("recontent"));
			ReplyServiceImpl.getReplyService().writeReply(replyDto);
			List<ReplyDto> list = ReplyServiceImpl.getReplyService().listReply(seq);
			System.out.println("ReplyWriteAction¸Þ¸ð±Û °¹¼ö : " + list.size());
			request.setAttribute("replylist", list);
		}
		return "/community/reply.jsp";
	}

}