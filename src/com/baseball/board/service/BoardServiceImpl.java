package com.baseball.board.service;

import java.util.*;

import com.baseball.board.dao.BoardDaoImpl;
import com.baseball.board.model.BoardDto;
import com.baseball.util.Constance;
import com.baseball.util.PageNavigation;

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
	

	@Override
	public BoardDto viewArticle(int seq) {
		BoardDaoImpl.getBoardDao().updateHit(seq);
		return BoardDaoImpl.getBoardDao().viewArticle(seq);
	}
	@Override
	public BoardDto notifyArticle(int seq) {
		BoardDaoImpl.getBoardDao().updateStatus(seq);
		BoardDaoImpl.getBoardDao().updateHit(seq);
		return BoardDaoImpl.getBoardDao().viewArticle(seq);
	}
	@Override
	public BoardDto prevArticle(int tno, int seq) {
		int pseq = BoardDaoImpl.getBoardDao().getPrevBno(tno, seq);
		BoardDaoImpl.getBoardDao().updateHit(pseq);
		return BoardDaoImpl.getBoardDao().viewArticle(pseq);
	}
	@Override
	public BoardDto nextArticle(int tno, int seq) {
		int nseq = BoardDaoImpl.getBoardDao().getNextBno(tno, seq);
		BoardDaoImpl.getBoardDao().updateHit(nseq);
		return BoardDaoImpl.getBoardDao().viewArticle(nseq);
	}

	@Override
	public List<BoardDto> listArticle(int tno, int pg, String key, String word) {

		int end = pg * Constance.BOARD_LIST_SIZE;
		int start = end - Constance.BOARD_LIST_SIZE;
		Map<String, String> map = new HashMap<String, String>();
		map.put("tno", tno + "");
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);

		return BoardDaoImpl.getBoardDao().listArticle(map);		
	}

	@Override
	public List<BoardDto> bestArticle(int tno) {
		return BoardDaoImpl.getBoardDao().bestArticle(tno);	
	}

	@Override
	public PageNavigation makePageNavigation(int tno, int pg, String key, String word, int listSize) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("tno", tno + "");
			map.put("key", key);
			map.put("word", word);
			
			PageNavigation navigation = new PageNavigation();
			int pgSize = Constance.PAGE_SIZE;
			navigation.setPageNo(pg);
//			int newArticleCount = BoardDaoImpl.getBoardDao().getNewArticleCount(tno);
//			navigation.setNewArticleCount(newArticleCount);
			int totalArticleCount = BoardDaoImpl.getBoardDao().getTotalArticleCount(map);
			navigation.setTotalArticleCount(totalArticleCount);
			int totalPageCount = (totalArticleCount - 1) / listSize + 1;
			
			System.out.println("BoardSI navigation >>" + totalArticleCount + " " + totalPageCount);
			
			navigation.setTotalPageCount(totalPageCount);
			navigation.setNowFirst(pg <= pgSize);
			navigation.setNowEnd(pg > (totalPageCount - 1) / pgSize * pgSize);
			return navigation;
	}	
	
	@Override
	public int modifyArticle(BoardDto boardDto) {
		return BoardDaoImpl.getBoardDao().modifyArticle(boardDto);
	}

	@Override
	public int deleteArticle(int seq) {
		return BoardDaoImpl.getBoardDao().deleteArticle(seq);
	}

	@Override
	public List<BoardDto> hotBoardArticle(int tno) {
		return BoardDaoImpl.getBoardDao().hotBoardArticle(tno);	
	}

}
