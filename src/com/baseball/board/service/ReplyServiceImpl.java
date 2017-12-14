package com.baseball.board.service;

import java.util.List;

import com.baseball.board.dao.ReplyDaoImpl;
import com.baseball.board.model.ReplyDto;


public class ReplyServiceImpl implements ReplyService {
	private static ReplyService replyService;
	
	static {
		replyService = new ReplyServiceImpl();
	}
	
	private ReplyServiceImpl() {}

	public static ReplyService getReplyService() {
		return replyService;
	}

	@Override
	public void writeReply(ReplyDto replyDto) {
		ReplyDaoImpl.getReplyDao().writeReply(replyDto);
	}

	@Override
	public List<ReplyDto> listReply(int seq) {
		return ReplyDaoImpl.getReplyDao().listReply(seq);
	}

	@Override
	public void deleteReply(int reno) {
		ReplyDaoImpl.getReplyDao().deleteReply(reno);
	}
}
