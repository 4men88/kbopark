package com.baseball.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.factory.GudanActionFactory;
import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.service.GudanServiceImpl;
import com.baseball.util.Constance;
import com.baseball.util.NullCheck;
import com.baseball.util.PageNavigation;
import com.baseball.util.StringEncoder;

public class BoardListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int tno = Integer.parseInt(request.getParameter("tno"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		
		GudanDto gudanDto = GudanServiceImpl.getGudanService().gudanArticle(tno);
		List<BoardDto> bestlist = BoardServiceImpl.getBoardService().bestArticle(tno);
		List<BoardDto> list = BoardServiceImpl.getBoardService().listArticle(tno, pg, key, word);

		PageNavigation navigation = BoardServiceImpl.getBoardService().makePageNavigation(tno, pg, key, word, Constance.BOARD_LIST_SIZE);
		navigation.setRoot(request.getContextPath());
		navigation.setTno(tno);
		navigation.setKey(key);
		navigation.setWord(word);
//		navigation.setNavigator();
		navigation.setBoardnavigator();
		System.out.println("BoardListAction navigation >> " + navigation.getBoardnavigator());
		
		request.setAttribute("gudandto", gudanDto);
		request.setAttribute("articlelist", list);
		request.setAttribute("bestlist", bestlist);
		request.setAttribute("navigator", navigation);	
		
		return "/community/list.jsp";
	}

}