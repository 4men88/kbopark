package com.baseball.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baseball.admin.model.NoticeDto;
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
	public List<MemberDetailDto> listmember(Map<String, String> map) {
		List<MemberDetailDto> list = new ArrayList<MemberDetailDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select name,m.mid,nvl(rookie,'0') rookie,to_char(m.joindate,'yyyy-mm-dd') joindate,\n");
			sql.append("	   nvl(penalty,'0') penalty,decode(mstatus,'1','È¸¿ø','2','Á¤Áö','3','Å»Åð') mstatus,t.tname\n");
			sql.append("from member m,member_detail md,team t\n");
			sql.append("where m.mid=md.mid and md.tno=t.tno\n");
			String word = map.get("word");
			String status = map.get("status");
			if(status.isEmpty()) {
				if(word!=null && !word.trim().isEmpty()) {
					String key = map.get("key");
					if("address".equals(key)) {
						sql.append("and md.addr1 like '%'||?||'%'");
					}else {
						sql.append("and m."+key+"=?");
					}
					
				}
			}else {
				if(word!=null && !word.trim().isEmpty()) {
					String key = map.get("key");
					if("address".equals(key)) {
						sql.append("and md.addr1 like '%'||?||'%' and mstatus=?");
					}else {
						sql.append("and m."+key+"=? and mstatus=?");
					}
					
				}else {
					sql.append("and mstatus=?");
				}
			}
			
			pstmt = conn.prepareStatement(sql.toString());
			if(status.isEmpty()) {
				if(word!=null&& !word.trim().isEmpty()) {
					pstmt.setString(1, word);				
				}
			}else {
				if(word!=null&& !word.trim().isEmpty()) {
					pstmt.setString(1, word);
					pstmt.setString(2, status);
				}else {
					pstmt.setString(1, status);
				}
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

	@Override
	public int writeNotice(Map<String, String> map) {
		int cnt=0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("insert into notice(no,subject,detail,count,writedate,ntype,name)\n");
			sql.append("values(notice_seq.nextval,?,?,0,sysdate,?,'admin')");
			String subject = map.get("subject");
			String context = map.get("context");
			String notitype = map.get("notitype");	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,subject);
			pstmt.setString(2,context);
			pstmt.setInt(3,Integer.parseInt(notitype));
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
	}

	@Override
	public List<NoticeDto> noticeList() {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select no,subject,detail,count,ntype,\n");
			sql.append("		case  \n");
			sql.append("		when to_char(writedate, 'yymmdd') = to_char(sysdate, 'yymmdd')\n");
			sql.append("		then to_char(writedate, 'hh24:mi:ss')\n");
			sql.append("		else to_char(writedate, 'yy.mm.dd')\n");
			sql.append("		end writedate\n");
			sql.append("from notice order by no desc");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDto noticeDto = new NoticeDto();
				noticeDto.setNo(rs.getInt("no"));
				noticeDto.setSubject(rs.getString("subject"));
				noticeDto.setContext(rs.getString("detail"));
				noticeDto.setCount(rs.getInt("count"));
				noticeDto.setWdate(rs.getString("writedate"));
				noticeDto.setNtype(rs.getInt("ntype"));
				
				list.add(noticeDto);
				
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
	public List<NoticeDto> noticeList(Map<String, String> map) {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select no,subject,detail,count,ntype,\n");
			sql.append("		case  \n");
			sql.append("		when to_char(writedate, 'yymmdd') = to_char(sysdate, 'yymmdd')\n");
			sql.append("		then to_char(writedate, 'hh24:mi:ss')\n");
			sql.append("		else to_char(writedate, 'yy.mm.dd')\n");
			sql.append("		end writedate\n");
			sql.append("from notice\n");
			sql.append("where ntype=?");
			
			pstmt = conn.prepareStatement(sql.toString());
			String ntype = map.get("ntype");
			pstmt.setInt(1, Integer.parseInt(ntype));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDto noticeDto = new NoticeDto();
				noticeDto.setNo(rs.getInt("no"));
				noticeDto.setSubject(rs.getString("subject"));
				noticeDto.setContext(rs.getString("detail"));
				noticeDto.setCount(rs.getInt("count"));
				noticeDto.setWdate(rs.getString("writedate"));
				noticeDto.setNtype(rs.getInt("ntype"));
				
				list.add(noticeDto);
				
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
	public NoticeDto viewNotice(int nno) {
		NoticeDto noticeDto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select no,subject,detail,name\n");
			sql.append("from notice\n");
			sql.append("where no=?");
						
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeDto = new NoticeDto();
				noticeDto.setNo(rs.getInt("no"));
				noticeDto.setSubject(rs.getString("subject"));
				noticeDto.setContext(rs.getString("detail"));
				noticeDto.setName(rs.getString("name"));	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return noticeDto;
	}

	@Override
	public int getNextSeq() {
		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select board_seq.nextval from dual");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			seq = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return seq;
	}

	@Override
	public void updateHit(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update board \n");
			sql.append("set hit = hit + 1 \n");
			sql.append("where seq = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}	
	}

	@Override
	public int getNewArticleCount() {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(no)\n");
			sql.append("from notice\n");
			sql.append("where to_char(writedate,'yymmdd')= to_char(sysdate,'yymmdd')\n");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}

	@Override
	public int getTotalArticleCount(Map<String,String> map) {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(no)\n");
			sql.append("from notice\n");
			String word = map.get("word");
			if(!word.isEmpty()) {
				String key = map.get("key");
				if("subject".equals(key)) {
					sql.append("and subject like '%'||?||'%'");
				}else {
					sql.append("and "+key+"=?");
				}
			}
			pstmt = conn.prepareStatement(sql.toString());
			
			if(!word.isEmpty())
				pstmt.setString(2, word);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}
}
