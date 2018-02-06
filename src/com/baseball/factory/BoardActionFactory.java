package com.baseball.factory;

import com.baseball.action.Action;
import com.baseball.board.action.*;

public class BoardActionFactory {
	
	private static Action boardWriteAction;
	private static Action boardViewAction;
	private static Action boardListAction;
	private static Action boardBestListAction;
	private static Action boardDeleteAction;
	private static Action boardModifyAction;
	private static Action boardMoveModifyAction;
	private static Action boardNotifyAction;
	private static Action boardPrevAction;
	private static Action boardNextAction;
	
	private static Action replyWriteAction;
	private static Action replyListAction;
	private static Action replyDeleteAction;
	
		
	static {
		boardWriteAction = new BoardWriteAction();
		boardViewAction = new BoardViewAction();
		boardListAction = new BoardListAction();
		boardBestListAction = new BoardBestListAction();
		boardDeleteAction = new BoardDeleteAction();
		boardModifyAction = new BoardModifyAction();
		boardMoveModifyAction = new BoardMoveModifyAction();
		boardNotifyAction = new BoardNotifyAction();
		boardPrevAction = new BoardPrevAction();
		boardNextAction = new BoardNextAction();
		
		replyWriteAction = new ReplyWriteAction();
		replyListAction = new ReplyListAction();
		replyDeleteAction = new ReplyDeleteAction();
	}

	public static Action getBoardBestListAction() {
		return boardBestListAction;
	}

	public static Action getBoardNotifyAction() {
		return boardNotifyAction;
	}

	public static Action getBoardPrevAction() {
		return boardPrevAction;
	}

	public static Action getBoardNextAction() {
		return boardNextAction;
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