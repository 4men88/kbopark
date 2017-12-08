package com.baseball.board.action;

public class ReplyListAction {

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

public class MemoListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		List<MemoDto> list = MemoServiceImpl.getMemoService().listMemo(seq);
		request.setAttribute("memolist", list);
		return "/memo/list.jsp";
	}

}
*/