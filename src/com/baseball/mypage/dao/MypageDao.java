package com.baseball.mypage.dao;


import com.baseball.auction.model.AuctionDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MypageDao {
	
	public MemberDetailDto myInfo(MemberDto memberDto);
	public int modifyInfo(MemberDetailDto memberdto);
	public AuctionDto selling(MemberDto memberDto);
	public AuctionDto buying(MemberDto memberDto);

	
	//	public Board myArticle(MemberDto memberDto);
		//	public Board myReply(MemberDto memberDto);
	
	
}
