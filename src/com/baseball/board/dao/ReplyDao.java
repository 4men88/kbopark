package com.baseball.board.dao;

import java.util.List;

import com.baseball.board.model.ReplyDto;

public interface ReplyDao {

	void writeReply(ReplyDto ReplyDto);
	List<ReplyDto> listReply(int seq);
	void deleteReply(int reno);

}
