package com.baseball.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
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
		
		List<BoardDto> list = BoardServiceImpl.getBoardService().listArticle(tno, pg, key, word);

		/*		PageNavigation navigation = BoardServiceImpl.getCommonService().makePageNavigation(bcode, pg, key, word, Constance.BOARD_LIST_SIZE);
		navigation.setRoot(request.getContextPath());
		navigation.setBcode(bcode);
		navigation.setKey(key);
		navigation.setWord(word);
		navigation.setNavigator();*/
		
		request.setAttribute("articlelist", list);
//		request.setAttribute("navigator", navigation);
		return "/community/list.jsp";
		
	}

}
/*		int bcode = Integer.parseInt(request.getParameter("bcode"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		List<AlbumDto> list = AlbumServiceImpl.getAlbumService().listArticle(bcode, pg, key, word);
		PageNavigation navigation = CommonServiceImpl.getCommonService().makePageNavigation(bcode, pg, key, word, BoardConstance.ALBUM_LIST_SIZE);
		navigation.setRoot(request.getContextPath());
		navigation.setBcode(bcode);
		navigation.setKey(key);
		navigation.setWord(word);
		navigation.setNavigator();*/
