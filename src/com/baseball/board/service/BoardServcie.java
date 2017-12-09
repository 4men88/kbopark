package com.baseball.board.service;

import com.baseball.board.model.BoardDto;

public interface BoardServcie {
	int getNextSeq();
//	PageNavigation makePageNavigation(int bcode, int pg, String key, String word, int listsize);
	
	int writeArticle(BoardDto boardDto);
//	int replyArticle(ReboardDto reboardDto);
//	ReboardDto viewArticle(int seq);
//	List<ReboardDto> listArticle(int bcode, int pg, String key, String word);
//	void modifyArticle(ReboardDto reboardDto);
//	void deleteArticle(int seq);
}
