package com.baseball.board.service;

import java.util.List;

import com.baseball.board.model.BoardDto;
import com.baseball.util.PageNavigation;

public interface BoardServcie {
	int getNextSeq();
	PageNavigation makePageNavigation(int tno, int pg, String key, String word, int listSize);
	
	int writeArticle(BoardDto boardDto);
	BoardDto viewArticle(int seq);
	List<BoardDto> listArticle(int tno, int pg, String key, String word);
	List<BoardDto> bestArticle(int tno);
	
	int modifyArticle(BoardDto boardDto);
	int deleteArticle(int seq);
	BoardDto notifyArticle(int seq);
	BoardDto prevArticle(int tno, int seq);
	BoardDto nextArticle(int tno, int seq);
	
//	int replyArticle(BoardDto boardDto);
	
}
