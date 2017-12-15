package com.baseball.mypage.service;

import java.util.List;
import java.util.Map;

import com.baseball.board.model.BoardDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;

public interface MypageService {

   int modifyMember(MemberDetailDto memberDto);
   List<BoardDto> listArticle(MemberDetailDto memberdto);
   List<ReplyDto> listReply(MemberDetailDto memberdto);
   
   
}