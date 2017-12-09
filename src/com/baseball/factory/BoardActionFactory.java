package com.baseball.factory;

import com.baseball.action.Action;
/*import com.kitri.album.action.AlbumDeleteAction;
import com.kitri.album.action.AlbumListAction;
import com.kitri.album.action.AlbumModifyAction;
import com.kitri.album.action.AlbumMoveModifyAction;
import com.kitri.album.action.AlbumViewAction;
import com.kitri.memo.action.MemoDeleteAction;
import com.kitri.memo.action.MemoListAction;
import com.kitri.memo.action.MemoWriteAction;
import com.kitri.reboard.action.ReboardDeleteAction;
import com.kitri.reboard.action.ReboardListAction;
import com.kitri.reboard.action.ReboardModifyAction;
import com.kitri.reboard.action.ReboardMoveModifyAction;
import com.kitri.reboard.action.ReboardMoveReplyAction;
import com.kitri.reboard.action.ReboardReplyAction;
import com.kitri.reboard.action.ReboardViewAction;
import com.kitri.reboard.action.ReboardWriteAction;*/
import com.baseball.board.action.BoardWriteAction;

public class BoardActionFactory {
	
	private static Action boardWriteAction;
		
	static {
		boardWriteAction = new BoardWriteAction();
	}

	public static Action getBoardWriteAction() {
		return boardWriteAction;
	}
	
	
	
/*	// 답변형게시판
		private static Action reboardReplyAction;
		private static Action reboardMoveReplyAction;
		private static Action reboardListAction;
		private static Action reboardViewAction;
		private static Action reboardModifyAction;
		private static Action reboardMoveModifyAction;
		private static Action reboardDeleteAction;
		
		//앨범게시판
		private static Action albumListAction;
		private static Action albumViewAction;
		private static Action albumModifyAction;
		private static Action albumMoveModifyAction;
		private static Action albumDeleteAction;
		
		//댓글
		private static Action memoWriteAction;
		private static Action memoListAction;
		private static Action memoDeleteAction;

		static {
			reboardReplyAction = new ReboardReplyAction();
			reboardMoveReplyAction = new ReboardMoveReplyAction();
			reboardListAction = new ReboardListAction();
			reboardViewAction = new ReboardViewAction();
			reboardModifyAction = new ReboardModifyAction();
			reboardMoveModifyAction = new ReboardMoveModifyAction();
			reboardDeleteAction = new ReboardDeleteAction();
			
			albumListAction = new AlbumListAction();
			albumViewAction = new AlbumViewAction();
			albumModifyAction = new AlbumModifyAction();
			albumMoveModifyAction = new AlbumMoveModifyAction();
			albumDeleteAction = new AlbumDeleteAction();
			
			memoWriteAction = new MemoWriteAction();
			memoListAction = new MemoListAction();
			memoDeleteAction = new MemoDeleteAction();
		}

		public static Action getReboardWriteAction() {
			return reboardWriteAction;
		}

		public static Action getReboardReplyAction() {
			return reboardReplyAction;
		}

		public static Action getReboardMoveReplyAction() {
			return reboardMoveReplyAction;
		}

		public static Action getReboardListAction() {
			return reboardListAction;
		}

		public static Action getReboardViewAction() {
			return reboardViewAction;
		}

		public static Action getReboardModifyAction() {
			return reboardModifyAction;
		}

		public static Action getReboardMoveModifyAction() {
			return reboardMoveModifyAction;
		}

		public static Action getReboardDeleteAction() {
			return reboardDeleteAction;
		}

		public static Action getAlbumListAction() {
			return albumListAction;
		}

		public static Action getAlbumViewAction() {
			return albumViewAction;
		}

		public static Action getAlbumModifyAction() {
			return albumModifyAction;
		}

		public static Action getAlbumMoveModifyAction() {
			return albumMoveModifyAction;
		}

		public static Action getAlbumDeleteAction() {
			return albumDeleteAction;
		}

		public static Action getMemoWriteAction() {
			return memoWriteAction;
		}

		public static Action getMemoListAction() {
			return memoListAction;
		}

		public static Action getMemoDeleteAction() {
			return memoDeleteAction;
		}*/
}
