package com.baseball.board.action;

public class BoardListAction {

}
/*package com.kitri.album.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.action.Action;
import com.kitri.board.model.AlbumDto;
import com.kitri.board.service.AlbumServiceImpl;
import com.kitri.common.service.CommonServiceImpl;
import com.kitri.util.*;

public class AlbumListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		int pg = NullCheck.nullToOne(request.getParameter("pg"));
		String key = StringEncoder.isoToMain(request.getParameter("key"));
		String word = StringEncoder.isoToMain(request.getParameter("word"));
		List<AlbumDto> list = AlbumServiceImpl.getAlbumService().listArticle(bcode, pg, key, word);
		PageNavigation navigation = CommonServiceImpl.getCommonService().makePageNavigation(bcode, pg, key, word, BoardConstance.ALBUM_LIST_SIZE);
		navigation.setRoot(request.getContextPath());
		navigation.setBcode(bcode);
		navigation.setKey(key);
		navigation.setWord(word);
		navigation.setNavigator();
		
		request.setAttribute("articlelist", list);
		request.setAttribute("navigator", navigation);
		return "/album/list.jsp";
	}

}
*/