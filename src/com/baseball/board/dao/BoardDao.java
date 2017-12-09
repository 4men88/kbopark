package com.baseball.board.dao;

import com.baseball.board.model.BoardDto;

public interface BoardDao {
	int getNextSeq();
//	PageNavigation makePageNavigation(int bcode, int pg, String key, String word, int listsize);
	
	int writeArticle(BoardDto boardDto);
/*	int replyArticle(ReboardDto reboardDto);
	ReboardDto viewArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> map);
	void modifyArticle(ReboardDto reboardDto);
	void deleteArticle(int seq);*/
}
