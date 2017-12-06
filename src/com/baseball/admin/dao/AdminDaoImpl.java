package com.baseball.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.db.DBConnection;

public class AdminDaoImpl implements AdminDao {
	private static AdminDao adminDao;
	
	static {
		
		adminDao = new AdminDaoImpl();
		
	}
	
	public static AdminDao getAdminDao() {
		return adminDao;
	}
	
	private AdminDaoImpl() {}
	@Override
	public List<MemberDetailDto> getAllUser() {
		List<MemberDetailDto> list = new ArrayList<MemberDetailDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select name,m.mid,nvl(rookie,'0') rookie,\n");
			sql.append("	   nvl(penalty,'0') penalty,nvl(mstatus,' ') mstatus\n");
			sql.append("from member m,member_detail md\n");
			sql.append("where m.mid=md.mid");
			pstmt=conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDetailDto memberDto = new MemberDetailDto();
				memberDto.setName(rs.getString("name"));
				memberDto.setId(rs.getString("mid"));
				memberDto.setRookie(rs.getInt("rookie"));
				memberDto.setPenalty(rs.getInt("penalty"));
				memberDto.setMstatus(rs.getString("mstatus"));
				
				list.add(memberDto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberDetailDto> getSelectUser() {
		// TODO Auto-generated method stub
		return null;
	}

}
