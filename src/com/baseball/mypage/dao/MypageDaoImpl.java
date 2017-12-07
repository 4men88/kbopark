package com.baseball.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.baseball.admin.model.AuctionDto;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.db.DBConnection;

public class MypageDaoImpl implements MypageDao {

	@Override
	public MemberDetailDto myInfo(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyInfo(MemberDetailDto memberdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update all\n");
			sql.append("	into member(pass,name,email1,email2)\n");
			sql.append("		values(?,?,?,?)\n");
			sql.append("	into member_detail(tel1,tel2,tel3,zip1,addr1,addr2,tno,penalty,mtype,mstatus)\n");
			sql.append("		values(?,?,?,?,?,?,?,0,'1','1')\n");
			sql.append("select * from dual");
			
			pstmt = conn.prepareStatement(sql.toString());
			int idx=0;
			pstmt.setString(++idx, memberdto.getPass());
			pstmt.setString(++idx, memberdto.getName());
			pstmt.setString(++idx, memberdto.getEmail1());
			pstmt.setString(++idx, memberdto.getEmail2());
			pstmt.setString(++idx, memberdto.getTel1());
			pstmt.setString(++idx, memberdto.getTel2());
			pstmt.setString(++idx, memberdto.getTel3());
			pstmt.setString(++idx, memberdto.getZip1());
			pstmt.setString(++idx, memberdto.getAddr1());
			pstmt.setString(++idx, memberdto.getAddr2());
			pstmt.setInt(++idx, memberdto.getTno());
			cnt=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
			
	}

	@Override
	public AuctionDto selling(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuctionDto buying(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

}
