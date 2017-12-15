package com.baseball.mypage.dao;


import java.util.List;
import java.util.Map;

import com.baseball.auction.model.AuctionDto;
import com.baseball.board.model.BoardDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MypageDao {
   
   public MemberDetailDto myInfo(MemberDetailDto memberdto);
   public int modifyInfo(MemberDetailDto memberdto);
   public AuctionDto selling(MemberDetailDto memberdto);
   public AuctionDto buying(MemberDetailDto memberdto);
   public List<BoardDto> listArticle(MemberDetailDto memberdto);
   public List<ReplyDto> replyArticle(MemberDetailDto memberdto);
   
   //   public Board myArticle(MemberDto memberDto);
      //   public Board myReply(MemberDto memberDto);
   
   
}