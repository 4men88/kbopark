package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.board.action.BoardDeleteAction;
import com.baseball.board.action.BoardListAction;
import com.baseball.board.action.BoardModifyAction;
import com.baseball.board.action.BoardMoveModifyAction;
import com.baseball.board.action.BoardViewAction;
import com.baseball.board.action.BoardWriteAction;
import com.baseball.board.action.ReplyDeleteAction;
import com.baseball.board.action.ReplyListAction;
import com.baseball.board.action.ReplyWriteAction;

public class BoardActionFactory {
	
	private static Action boardWriteAction;
	private static Action boardViewAction;
	private static Action boardListAction;
	private static Action boardDeleteAction;
	private static Action boardModifyAction;
	private static Action boardMoveModifyAction;
	
	private static Action replyWriteAction;
	private static Action replyListAction;
	private static Action replyDeleteAction;
	
		
	static {
		boardWriteAction = new BoardWriteAction();
		boardViewAction = new BoardViewAction();
		boardListAction = new BoardListAction();
		boardDeleteAction = new BoardDeleteAction();
		boardModifyAction = new BoardModifyAction();
		boardMoveModifyAction = new BoardMoveModifyAction();
		
		replyWriteAction = new ReplyWriteAction();
		replyListAction = new ReplyListAction();
		replyDeleteAction = new ReplyDeleteAction();
	}

	public static Action getBoardWriteAction() {
		return boardWriteAction;
	}

	public static Action getBoardViewAction() {
		return boardViewAction;
	}

	public static Action getBoardListAction() {
		return boardListAction;
	}

	public static Action getBoardDeleteAction() {
		return boardDeleteAction;
	}

	public static Action getBoardModifyAction() {
		return boardModifyAction;
	}

	public static Action getBoardMoveModifyAction() {
		return boardMoveModifyAction;
	}

	public static Action getReplyWriteAction() {
		return replyWriteAction;
	}

	public static Action getReplyListAction() {
		return replyListAction;
	}

	public static Action getReplyDeleteAction() {
		return replyDeleteAction;
	}
}