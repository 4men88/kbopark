package com.baseball.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.member.model.MemberDto;
import com.baseball.util.NullCheck;
import com.baseball.util.StringEncoder;

public class BoardWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "/index.jsp";
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		System.out.println("BoardWriteAction memberDto >>> " + memberDto);
		
		if(memberDto != null) {
			int seq = BoardServiceImpl.getBoardService().getNextSeq();
			if(seq != 0) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBno(seq);
				boardDto.setMid(memberDto.getId());
				boardDto.setBname(StringEncoder.isoToMain(request.getParameter("subject")).replace("<", "&lt;").replace(">", "&gt;"));
				boardDto.setBdetail(StringEncoder.isoToMain(request.getParameter("content")));
				boardDto.setTno(NullCheck.nullToZero(request.getParameter("boardtno")));
				
				System.out.println(boardDto.getBno()+boardDto.getMid()+boardDto.getBname()+boardDto.getBdetail()+boardDto.getTno());
				//조회수, 작성시각, 신고상태는 작성시 설정필요없음.
				int cnt = BoardServiceImpl.getBoardService().writeArticle(boardDto);
				System.out.println("BoardWriteAction cnt >>> " + cnt);
				if(cnt != 0) {
					request.setAttribute("seq", seq + "");
					path = "/community/writeok.jsp";
				} else {
					path = "/community/writefail.jsp";
				}
			}
		}
		System.out.println("BoardWriteAction 최종path >>> " + path);
		return path;
	}

}
