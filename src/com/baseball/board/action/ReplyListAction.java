package com.baseball.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.ReplyDto;
import com.baseball.board.service.ReplyServiceImpl;

public class ReplyListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		List<ReplyDto> list = ReplyServiceImpl.getReplyService().listReply(seq);
		request.setAttribute("replylist", list);
		return "/community/reply.jsp";
	}

}
