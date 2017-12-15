package com.baseball.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseball.action.Action;
import com.baseball.admin.model.NoticeDto;
import com.baseball.admin.service.AdminServiceImpl;
import com.baseball.board.model.BoardDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.mypage.service.MypageServiceImpl;

public class MypageMainAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path= "";
		HttpSession session = request.getSession();
		MemberDetailDto memberDto = (MemberDetailDto) session.getAttribute("userInfo");
		
		List<NoticeDto> noticeList = AdminServiceImpl.getAdminService().noticeList();
		List<BoardDto> boardList = MypageServiceImpl.getMypageService().listArticle(memberDto);
		List<ReplyDto> replyList = MypageServiceImpl.getMypageService().listReply(memberDto);
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("replyList", replyList);
	
		path = "mypage/mypageMain.jsp" ;
		
		return path ;
	}

}


