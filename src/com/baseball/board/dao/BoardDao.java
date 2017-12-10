package com.baseball.board.dao;

import com.baseball.board.model.BoardDto;

public interface BoardDao {
	int getNextSeq();
	void updateHit(int seq);
//	PageNavigation makePageNavigation(int bcode, int pg, String key, String word, int listsize);
	
	int writeArticle(BoardDto boardDto);
	BoardDto viewArticle(int seq);
	int deleteArticle(int seq);
	int modifyArticle(BoardDto boardDto);	
	
/*	int replyArticle(BoardDto BoardDto);
	List<BoardDto> listArticle(Map<String, String> map);
	*/
}
