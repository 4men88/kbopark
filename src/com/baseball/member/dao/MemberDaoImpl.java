package com.baseball.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class MemberDaoImpl implements MemberDao {
	
	private static MemberDao memberDao;
	
	static {
		
		memberDao = new MemberDaoImpl();
		
	}
	
	private MemberDaoImpl() {}
	
	public static MemberDao getMemberDao() {
		return memberDao;
	}


	@Override
	public int registMember(MemberDetailDto memberdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert all\n");
			sql.append("	into member(mid,pass,name,email1,email2,joindate)\n");
			sql.append("		values(?,?,?,?,?,sysdate)\n");
			sql.append("	into member_detail(mid,tel1,tel2,tel3,zip1,addr1,addr2,tno,rookie,penalty,mtype,mstatus)\n");
			sql.append("		values(?,?,?,?,?,?,?,?,0,0,1,1)\n");
			sql.append("select * from dual");
			pstmt = conn.prepareStatement(sql.toString());
			int idx=0;
			pstmt.setString(++idx, memberdto.getId());
			pstmt.setString(++idx, memberdto.getPass());
			pstmt.setString(++idx, memberdto.getName());
			pstmt.setString(++idx, memberdto.getEmail1());
			pstmt.setString(++idx, memberdto.getEmail2());
			pstmt.setString(++idx, memberdto.getId());
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
	public MemberDto logIn(Map<String,String> map) {
		MemberDto memberDto=null;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select mid,name,email1,email2\n");
			sql.append("from member\n");
			sql.append("where mid=? and pass=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("pass"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setId(rs.getString("mid"));
				memberDto.setName(rs.getString("name"));
				memberDto.setEmail1(rs.getString("email1"));
				memberDto.setEmail1(rs.getString("email2"));
				System.out.println(memberDto.getId());
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt,rs);
		}
		return memberDto;
	}

	@Override
	public int idCheck(String id) {
		int cnt=1;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) idck\n");
			sql.append("from member\n");
			sql.append("where mid = ?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public String idFind(MemberDetailDto memberDto) {
		String id=null;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select mid\n");
			sql.append("from member\n");
			sql.append("where name = ? and email1=? and email2=?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getName());
			pstmt.setString(2, memberDto.getEmail1());
			pstmt.setString(3, memberDto.getEmail2());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("mid");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return id;
	}


	

}
