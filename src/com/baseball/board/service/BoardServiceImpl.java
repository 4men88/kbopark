package com.baseball.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baseball.board.dao.BoardDaoImpl;
import com.baseball.board.model.BoardDto;

public class BoardServiceImpl implements BoardServcie {

	private static BoardServcie boardService;
	
	static {
		boardService = new BoardServiceImpl();
	}
	
	private BoardServiceImpl() {}
	
	public static BoardServcie getBoardService() {
		return boardService;
	}

	@Override
	public int getNextSeq() {
		return BoardDaoImpl.getBoardDao().getNextSeq();
	}

	@Override
	public int writeArticle(BoardDto boardDto) {
		return BoardDaoImpl.getBoardDao().writeArticle(boardDto);
	}	

/*	@Override
	public PageNavigation makePageNavigation(int bcode, int pg, String key, String word, int listsize) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bcode", bcode + "");
		map.put("key", key);
		map.put("word", word);
		
		PageNavigation navigation = new PageNavigation();
		int pgSize = BoardConstance.PAGE_SIZE;
		navigation.setPageNo(pg);
		int newArticleCount = CommonDaoImpl.getCommonDao().getNewArticleCount(bcode);
		navigation.setNewArticleCount(newArticleCount);
		int totalArticleCount = CommonDaoImpl.getCommonDao().getTotalArticleCount(map);
		navigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / listsize + 1;
		navigation.setTotalPageCount(totalPageCount);
		navigation.setNowFirst(pg <= pgSize);
		navigation.setNowEnd(pg > (totalPageCount - 1) / pgSize * pgSize);
		return navigation;
	}*/
	
/*	

	@Override
	public int replyArticle(ReboardDto reboardDto) {
		return ReboardDaoImpl.getReboardDao().replyArticle(reboardDto);
	}

	@Override
	public ReboardDto viewArticle(int seq) {
		CommonDaoImpl.getCommonDao().updateHit(seq);
		return ReboardDaoImpl.getReboardDao().viewArticle(seq);
	}

	@Override
	public List<ReboardDto> listArticle(int bcode, int pg, String key, String word) {
		int end = pg * BoardConstance.BOARD_LIST_SIZE;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		Map<String, String> map = new HashMap<String, String>();
		map.put("bcode", bcode + "");
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);

		return ReboardDaoImpl.getReboardDao().listArticle(map);
	}

	@Override
	public void modifyArticle(ReboardDto reboardDto) {

	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub

	}
*/

}
