package com.baseball.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baseball.member.model.MemberDetailDto;
import com.baseball.util.db.DBClose;
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
			sql.append("select name,m.mid,nvl(rookie,'0') rookie,m.joindate,\n");
			sql.append("	   nvl(penalty,'0') penalty,decode(mstatus,'1','È¸¿ø','2','Á¤Áö','3','Å»Åð') mstatus,t.tname\n");
			sql.append("from member m,member_detail md,team t\n");
			sql.append("where m.mid=md.mid and md.tno=t.tno");
			
			pstmt=conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDetailDto memberDto = new MemberDetailDto();
				memberDto.setName(rs.getString("name"));
				memberDto.setId(rs.getString("mid"));
				memberDto.setRookie(rs.getInt("rookie"));
				memberDto.setPenalty(rs.getInt("penalty"));
				memberDto.setFavoriteteam(rs.getString("tname"));
				memberDto.setMstatus(rs.getString("mstatus"));
				memberDto.setJoindate(rs.getString("joindate"));
				
				list.add(memberDto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<MemberDetailDto> getSelectUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberDetailDto> listmember(Map<String, String> map) {
		List<MemberDetailDto> list = new ArrayList<MemberDetailDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select name,m.mid,nvl(rookie,'0') rookie,m.joindate,\n");
			sql.append("	   nvl(penalty,'0') penalty,decode(mstatus,'1','È¸¿ø','2','Á¤Áö','3','Å»Åð') mstatus,t.tname\n");
			sql.append("from member m,member_detail md,team t\n");
			sql.append("where m.mid=md.mid and md.tno=t.tno");
			String word = map.get("word");
			if(word!=null && !word.trim().isEmpty()) {
				String key = map.get("key");
				if("address".equals(key)) {
					sql.append("and md.addr1 like '%'||?||'%'");
				}else {
					sql.append("and m."+key+"=?");
				}
				
			}
			pstmt = conn.prepareStatement(sql.toString());
			if(word!=null&& !word.trim().isEmpty()) {
				pstmt.setString(1, word);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDetailDto memberDto = new MemberDetailDto();
				memberDto.setName(rs.getString("name"));
				memberDto.setId(rs.getString("mid"));
				memberDto.setRookie(rs.getInt("rookie"));
				memberDto.setPenalty(rs.getInt("penalty"));
				memberDto.setFavoriteteam(rs.getString("tname"));
				memberDto.setMstatus(rs.getString("mstatus"));
				memberDto.setJoindate(rs.getString("joindate"));
				
				list.add(memberDto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public void updatePen(String id,String type) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			if("up".equals(type)) {
				sql.append("update member_detail\n");
				sql.append("set penalty=penalty+1\n");
				sql.append("where mid=?");
			}else {
				sql.append("update member_detail\n");
				sql.append("set penalty=penalty-1\n");
				sql.append("where mid=?");
			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		
	}

	@Override
	public void changestat(String id, int stat) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("update member_detail\n");
			sql.append("set mstatus=?\n");
			sql.append("where mid=?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,stat);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		
		
	}
}
