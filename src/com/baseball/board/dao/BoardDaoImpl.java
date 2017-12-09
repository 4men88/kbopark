package com.baseball.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.baseball.board.model.BoardDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class BoardDaoImpl implements BoardDao {

	private static BoardDao boardDao;
	
	static {
		boardDao = new BoardDaoImpl();
	}
	
	private BoardDaoImpl() {}
	
	public static BoardDao getBoardDao() {
		return boardDao;
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
	public int writeArticle(BoardDto boardDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into board (bno, mid, bname, bdetail, tno, bcount, bdate, bstatus) \n");
			sql.append("			values (?, ?, ?, ?, ?, 0, sysdate, 0) \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setInt(++idx, boardDto.getBno());
			pstmt.setString(++idx, boardDto.getMid());
			pstmt.setString(++idx, boardDto.getBname());
			pstmt.setString(++idx, boardDto.getBdetail());
			pstmt.setInt(++idx, boardDto.getTno());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	
/*	@Override
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
	public int getNewArticleCount(int bcode) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(seq) \n");
			sql.append("from board \n");
			sql.append("where bcode = ? \n");
			sql.append("and to_char(logtime, 'yymmdd') = to_char(sysdate, 'yymmdd')");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bcode);
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
	public int getTotalArticleCount(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(seq) \n");
			sql.append("from board \n");
			sql.append("where bcode = ? \n");
			String word = map.get("word");
			if(!word.isEmpty()) {
				String key = map.get("key");
				if("subject".equals(key)) {
					sql.append("and subject like '%'||?||'%'");
				} else {
					sql.append("and " + key + " = ? \n");
				}
			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, map.get("bcode"));
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
	}*/
/*	
	

	@Override
	public int replyArticle(ReboardDto reboardDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			//step 증가
			StringBuffer update_step = new StringBuffer();
			update_step.append("update reboard \n");
			update_step.append("set step = step + 1 \n");
			update_step.append("where ref = ? and step > ?");
			pstmt = conn.prepareStatement(update_step.toString());
			pstmt.setInt(1, reboardDto.getRef());
			pstmt.setInt(2, reboardDto.getStep());
			pstmt.executeUpdate();
			pstmt.close();
			
			//답글쓰기
			StringBuffer insert_reply = new StringBuffer();
			insert_reply.append("insert all \n");
			insert_reply.append("	into board (seq, name, id, email, subject, content, hit, logtime, bcode) \n");
			insert_reply.append("	values (?, ?, ?, ?, ?, ?, 0, sysdate, ?) \n");
			insert_reply.append("	into reboard (rseq, seq, ref, lev, step, pseq, reply) \n");
			insert_reply.append("	values (reboard_rseq.nextval, ?, ?, ?, ?, ?, 0) \n");
			insert_reply.append("select * from dual");
			pstmt = conn.prepareStatement(insert_reply.toString());
			int idx = 0;
			pstmt.setInt(++idx, reboardDto.getSeq());
			pstmt.setString(++idx, reboardDto.getName());
			pstmt.setString(++idx, reboardDto.getId());
			pstmt.setString(++idx, reboardDto.getEmail());
			pstmt.setString(++idx, reboardDto.getSubject());
			pstmt.setString(++idx, reboardDto.getContent());
			pstmt.setInt(++idx, reboardDto.getBcode());
			pstmt.setInt(++idx, reboardDto.getSeq());
			pstmt.setInt(++idx, reboardDto.getRef());
			pstmt.setInt(++idx, reboardDto.getLev() + 1);
			pstmt.setInt(++idx, reboardDto.getStep() + 1);
			pstmt.setInt(++idx, reboardDto.getPseq());
			pstmt.executeUpdate();
			pstmt.close();
			
			//답글수 증가
			StringBuffer update_reply = new StringBuffer();
			update_reply.append("update reboard \n");
			update_reply.append("set reply = reply + 1 \n");
			update_reply.append("where seq = ?");
			pstmt = conn.prepareStatement(update_reply.toString());
			pstmt.setInt(1, reboardDto.getPseq());
			pstmt.executeUpdate();
			
			conn.commit();
			cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
				cnt = 0;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public ReboardDto viewArticle(int seq) {
		ReboardDto reboardDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select b.seq, b.name, b.id, b.email, b.subject, \n");
			sql.append("	   b.content, b.hit, b.logtime, b.bcode, \n");
			sql.append("	   r.rseq, r.ref, r.lev, r.step, r.pseq, r.reply \n");
			sql.append("from board b, reboard r \n");
			sql.append("where b.seq = r.seq \n");
			sql.append("and b.seq = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reboardDto = new ReboardDto();
				reboardDto.setSeq(rs.getInt("seq"));
				reboardDto.setName(rs.getString("name"));
				reboardDto.setId(rs.getString("id"));
				reboardDto.setEmail(rs.getString("email"));
				reboardDto.setSubject(rs.getString("subject"));
				reboardDto.setContent(rs.getString("content"));
				reboardDto.setHit(rs.getInt("hit"));
				reboardDto.setLogtime(rs.getString("logtime"));
				reboardDto.setBcode(rs.getInt("bcode"));
				reboardDto.setRseq(rs.getInt("rseq"));
				reboardDto.setRef(rs.getInt("ref"));
				reboardDto.setLev(rs.getInt("lev"));
				reboardDto.setStep(rs.getInt("step"));
				reboardDto.setPseq(rs.getInt("pseq"));
				reboardDto.setReply(rs.getInt("reply"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return reboardDto;
	}

	@Override
	public List<ReboardDto> listArticle(Map<String, String> map) {
		List<ReboardDto> list = new ArrayList<ReboardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select b.* \n");
			sql.append("from ( \n");
			sql.append("	  select rownum rn, a.* \n");
			sql.append("	  from ( \n");
			sql.append("	  	  select  b.seq, b.name, b.id, b.email, b.subject,  \n");
			sql.append("			  	  b.content, b.hit, b.bcode, \n");
			sql.append("				  case  \n");
			sql.append("					when to_char(b.logtime, 'yymmdd') = to_char(sysdate, 'yymmdd') \n");
			sql.append("					then to_char(b.logtime, 'hh24:mi:ss') \n");
			sql.append("					else to_char(b.logtime, 'yy.mm.dd') \n");
			sql.append("				  end logtime,  \n");
			sql.append("			  	  r.rseq, r.ref, r.lev, r.step, r.pseq, r.reply \n");
			sql.append("	  	  from board b, reboard r \n");
			sql.append("	  	  where b.seq = r.seq \n");
			sql.append("	  	  and bcode = ? \n");
			
			String word = map.get("word");
			if(!word.isEmpty()) {
				String key = map.get("key");
				if("subject".equals(key))
					sql.append("	  	  and subject like '%'||?||'%' \n");
				else
					sql.append("	  	  and b." + key + " = ? \n");
			}
			sql.append("	  	  order by ref desc, step \n");
			sql.append("	 	  ) a \n");
			sql.append("	  where rownum <= ? \n");
			sql.append("	 ) b \n");
			sql.append("where b.rn > ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, map.get("bcode"));
			if(!word.isEmpty())
				pstmt.setString(++idx, word);			
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReboardDto reboardDto = new ReboardDto();
				reboardDto.setSeq(rs.getInt("seq"));
				reboardDto.setName(rs.getString("name"));
				reboardDto.setId(rs.getString("id"));
				reboardDto.setEmail(rs.getString("email"));
				reboardDto.setSubject(rs.getString("subject"));
				reboardDto.setContent(rs.getString("content"));
				reboardDto.setHit(rs.getInt("hit"));
				reboardDto.setLogtime(rs.getString("logtime"));
				reboardDto.setBcode(rs.getInt("bcode"));
				reboardDto.setRseq(rs.getInt("rseq"));
				reboardDto.setRef(rs.getInt("ref"));
				reboardDto.setLev(rs.getInt("lev"));
				reboardDto.setStep(rs.getInt("step"));
				reboardDto.setPseq(rs.getInt("pseq"));
				reboardDto.setReply(rs.getInt("reply"));
				
				list.add(reboardDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public void modifyArticle(ReboardDto reboardDto) {

	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub

	}*/	
}
