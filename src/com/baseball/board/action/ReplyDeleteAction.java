package com.baseball.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;

public class ReplyDeleteAction implements Action {

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.action.Action;
import com.kitri.board.model.MemoDto;
import com.kitri.board.service.MemoServiceImpl;

public class MemoDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int mseq = Integer.parseInt(request.getParameter("mseq"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		MemoServiceImpl.getMemoService().deleteMemo(mseq);
		List<MemoDto> list = MemoServiceImpl.getMemoService().listMemo(seq);
		request.setAttribute("memolist", list);
		return "/memo/list.jsp";
	}

}
*/