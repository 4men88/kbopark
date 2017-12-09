package com.baseball.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.board.model.BoardDto;
import com.baseball.board.service.BoardServiceImpl;
import com.baseball.util.NullCheck;

public class BoardViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	int seq = NullCheck.nullToZero(request.getParameter("seq"));
	if(seq != 0) {
		BoardDto boardDto = BoardServiceImpl.getBoardService().viewArticle(seq);
		
		request.setAttribute("article", boardDto);
	}
	return "/community/view.jsp";
	}

}
/*
 * package com.kitri.album.action;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.kitri.action.Action; import com.kitri.board.model.AlbumDto; import
 * com.kitri.board.service.AlbumServiceImpl; import com.kitri.util.NullCheck;
 * 
 * public class AlbumViewAction implements Action {
 * 
 * @Override public String execute(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException { int seq
 * = NullCheck.nullToZero(request.getParameter("seq")); if(seq != 0) { AlbumDto
 * albumDto = AlbumServiceImpl.getAlbumService().viewArticle(seq);
 * 
 * request.setAttribute("article", albumDto); } return "/album/view.jsp"; }
 * 
 * }
 */