package com.baseball.board.service;

import java.util.List;

import com.baseball.board.model.BoardDto;

public interface BoardServcie {
	int getNextSeq();
//	PageNavigation makePageNavigation(int bcode, int pg, String key, String word, int listsize);
	
	int writeArticle(BoardDto boardDto);
	BoardDto viewArticle(int seq);
	List<BoardDto> listArticle(int tno, int pg, String key, String word);
	
//	int replyArticle(ReboardDto reboardDto);
//	void modifyArticle(ReboardDto reboardDto);
//	void deleteArticle(int seq);

	
}
