package com.baseball.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baseball.auction.model.AuctionDto;
import com.baseball.board.model.BoardDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.board.model.ReplyDto;
import com.baseball.member.dao.MemberDao;
import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class MypageDaoImpl implements MypageDao {

	private static MypageDao mypageDao;
	private PreparedStatement pstmt2;
	
	static {
		
		mypageDao = new MypageDaoImpl();
		
	}
	
	private MypageDaoImpl() {}
	
	public static MypageDao getMypageDao() {
		return mypageDao;
	}

	
	
	
	
	
	@Override
	public MemberDetailDto myInfo(MemberDetailDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyInfo(MemberDetailDto memberDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt3 = null;
		int cnt1 = 0;
		int cnt2 =0;
		try {
			System.out.println("MypageDaoImpl>>>>>>>>modifyinfo 실행");
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			StringBuffer sql2 = new StringBuffer();
			sql.append("update member\n");
			sql.append("set pass=?,name=?,email1=?,email2=? \n");
			sql.append("where mid=?");
		
			pstmt = conn.prepareStatement(sql.toString());
			int idx=0;
			pstmt.setString(++idx, memberDto.getPass());
			pstmt.setString(++idx, memberDto.getName());
			pstmt.setString(++idx, memberDto.getEmail1());
			pstmt.setString(++idx, memberDto.getEmail2());
			pstmt.setString(++idx, memberDto.getId());
			cnt1=pstmt.executeUpdate();
			System.out.println("memberDetaildto>>>modifyinfo>>>member 테이블 완료==="+cnt1);
			
			idx=0;
			sql2.append("update member_detail");
			sql2.append("set tel1=?, tel2=?, tel3=?, zip1=?, addr1=?, addr2=?, tno=?");
			sql2.append("where mid=?");
			
			pstmt3= conn.prepareStatement(sql.toString());
			pstmt3.setString(++idx, memberDto.getTel1());
			pstmt3.setString(++idx, memberDto.getTel2());
			pstmt3.setString(++idx, memberDto.getTel3());
			pstmt3.setString(++idx, memberDto.getZip1());
			pstmt3.setString(++idx, memberDto.getAddr1());
			pstmt3.setString(++idx, memberDto.getAddr2());
			pstmt3.setInt(++idx, memberDto.getTno());
			pstmt3.setString(++idx, memberDto.getId());
			cnt2=pstmt3.executeUpdate();
			System.out.println("memberDetaildto>>>modifyinfo>>>member_detail 테이블 완료==="+cnt2);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cnt1*cnt2;
			
	}
	
	@Override
	public List<BoardDto> listArticle(MemberDetailDto memberDto) {
		List<BoardDto> boardlist = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dao.listarticle()왔어");
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("	select bno, bname, bdetail, tno, bcount, bstatus, bdate \n");
			sql.append("	from board \n");
			sql.append("	where mid = ? \n");
			sql.append("	order by bno desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBno(rs.getInt("bno"));
				boardDto.setBname(rs.getString("bname"));
				boardDto.setBdetail(rs.getString("bdetail"));
				boardDto.setTno(rs.getInt("tno"));
				boardDto.setBcount(rs.getInt("bcount"));
				boardDto.setBstatus(rs.getInt("bstatus"));
				boardDto.setBdate(rs.getString("bdate"));
				boardDto.setMid(memberDto.getId());
				boardlist.add(boardDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return boardlist;
	}
	
	
	


	@Override
	public AuctionDto selling(MemberDetailDto memberdto) {
		
		return null;
	}

	@Override
	public AuctionDto buying(MemberDetailDto memberdto) {
		
		return null;
	}

	@Override
	public List<ReplyDto> replyArticle(MemberDetailDto memberDto) {
		List<ReplyDto> replylist = new ArrayList<ReplyDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dao.replyarticle()왔어");
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("	select reno, bno, recontent \n");
			sql.append("	from board_reply \n");
			sql.append("	where mid = ? \n");
			sql.append("	order by reno desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReplyDto replyDto = new ReplyDto();
				replyDto.setReno(rs.getInt("bdetail"));
				replyDto.setBno(rs.getInt("bno"));
				replyDto.setRecontent(rs.getString("bname"));
				replylist.add(replyDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return replylist;
	}


}
