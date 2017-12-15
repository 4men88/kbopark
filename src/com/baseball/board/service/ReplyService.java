package com.baseball.board.service;

import java.util.List;

import com.baseball.board.model.ReplyDto;

public interface ReplyService {

	void writeReply(ReplyDto replyDto);

	List<ReplyDto> listReply(int seq);

	void deleteReply(int reno);

}
