package com.baseball.mypage.dao;


import java.util.List;
import java.util.Map;

import com.baseball.auction.model.AuctionDto;
import com.baseball.board.model.BoardDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MypageDao {
	
	public MemberDetailDto myInfo(MemberDto memberDto);
	public int modifyInfo(MemberDetailDto memberdto);
	public AuctionDto selling(MemberDto memberDto);
	public AuctionDto buying(MemberDto memberDto);
	public List<BoardDto> myListArticle(MemberDetailDto memberDto);
	
	//	public Board myArticle(MemberDto memberDto);
		//	public Board myReply(MemberDto memberDto);
	
	
}
