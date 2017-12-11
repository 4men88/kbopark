package com.baseball.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baseball.board.model.BoardDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class BoardDaoImpl implements BoardDao {

	private static BoardDao boardDao;

	static {
		boardDao = new BoardDaoImpl();
	}

	private BoardDaoImpl() {
	}

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

	@Override
	public void updateHit(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update board \n");
			sql.append("set bcount = bcount + 1 \n");
			sql.append("where bno = ?");
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
	public BoardDto viewArticle(int seq) {
		BoardDto boardDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select b.bno, b.mid, b.bname, b.bdetail, b.tno, b.bcount, b.bdate, b.bstatus \n");
			sql.append("from board b \n");
			sql.append("where b.bno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardDto = new BoardDto();
				boardDto.setBno(rs.getInt("bno"));
				boardDto.setMid(rs.getString("mid"));
				boardDto.setBname(rs.getString("bname"));
				boardDto.setBdetail(rs.getString("bdetail"));
				boardDto.setTno(rs.getInt("tno"));
				boardDto.setBcount(rs.getInt("bcount"));
				boardDto.setBdate(rs.getString("bdate"));
				boardDto.setBstatus(rs.getInt("bstatus"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return boardDto;
	}

	@Override
	public int modifyArticle(BoardDto boardDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();

			sql.append("UPDATE board \n");
			sql.append("SET bname = ?, bdetail = ?, tno = ? \n");
			sql.append("WHERE bno = ? LIMIT 1");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, boardDto.getBname());
			pstmt.setString(++idx, boardDto.getBdetail());
			pstmt.setInt(++idx, boardDto.getTno());
			pstmt.setInt(++idx, boardDto.getBno());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int deleteArticle(int seq) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM board \n");
			sql.append("WHERE bno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, seq);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		System.out.println("BoardDaoImpl Delete 최종cnt >>> " + cnt);
		return cnt;
	}

	@Override
	public List<BoardDto> listArticle(Map<String, String> map) {
		List<BoardDto> list = new ArrayList<BoardDto>();
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
			sql.append("	  	  select  bno, mid, bname, bdetail, tno, bcount, bstatus, \n");
			sql.append("				  case  \n");
			sql.append("					when to_char(bdate, 'yymmdd') = to_char(sysdate, 'yymmdd') \n");
			sql.append("					then to_char(bdate, 'hh24:mi:ss') \n");
			sql.append("					else to_char(bdate, 'yy.mm.dd') \n");
			sql.append("				  end bdate \n");
			sql.append("	  	  from board b \n");
			sql.append("	  	  where b.tno = ? \n");
			String word = map.get("word");
			if (!word.isEmpty()) {
				String key = map.get("key");
				if ("bname".equals(key))
					sql.append("	  	  and bname like '%'||?||'%' \n");
				else
					sql.append("	  	  and " + key + " = ? \n");
			}
			sql.append("	  	  order by bdate desc \n");
			sql.append("	 	  ) a \n");
			sql.append("	  where rownum <= ? \n");
			sql.append("	 ) b \n");
			sql.append("where b.rn > ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, map.get("tno"));
			if (!word.isEmpty())
				pstmt.setString(++idx, word);
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBno(rs.getInt("bno"));
				boardDto.setMid(rs.getString("mid"));
				boardDto.setBname(rs.getString("bname"));
				boardDto.setBdetail(rs.getString("bdetail"));
				boardDto.setTno(rs.getInt("tno"));
				boardDto.setBcount(rs.getInt("bcount"));
				boardDto.setBdate(rs.getString("bdate"));
				boardDto.setBstatus(rs.getInt("bstatus"));
				list.add(boardDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}
}

/*
 * @Override public int getNewArticleCount(int bcode) { int count = 0;
 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
 * try { conn = DBConnection.makeConnection(); StringBuffer sql = new
 * StringBuffer(); sql.append("select count(seq) \n");
 * sql.append("from board \n"); sql.append("where bcode = ? \n");
 * sql.append("and to_char(logtime, 'yymmdd') = to_char(sysdate, 'yymmdd')");
 * pstmt = conn.prepareStatement(sql.toString()); pstmt.setInt(1, bcode); rs =
 * pstmt.executeQuery(); rs.next(); count = rs.getInt(1); } catch (SQLException
 * e) { e.printStackTrace(); } finally { DBClose.close(conn, pstmt, rs); }
 * return count; }
 * 
 * @Override public int getTotalArticleCount(Map<String, String> map) { int
 * count = 0; Connection conn = null; PreparedStatement pstmt = null; ResultSet
 * rs = null; try { conn = DBConnection.makeConnection(); StringBuffer sql = new
 * StringBuffer(); sql.append("select count(seq) \n");
 * sql.append("from board \n"); sql.append("where bcode = ? \n"); String word =
 * map.get("word"); if(!word.isEmpty()) { String key = map.get("key");
 * if("subject".equals(key)) { sql.append("and subject like '%'||?||'%'"); }
 * else { sql.append("and " + key + " = ? \n"); } } pstmt =
 * conn.prepareStatement(sql.toString()); pstmt.setString(1, map.get("bcode"));
 * if(!word.isEmpty()) pstmt.setString(2, word); rs = pstmt.executeQuery();
 * rs.next(); count = rs.getInt(1); } catch (SQLException e) {
 * e.printStackTrace(); } finally { DBClose.close(conn, pstmt, rs); } return
 * count; }
 */
/*
 * 
 * 
 * @Override public int replyArticle(BoardDto BoardDto) { int cnt = 0;
 * Connection conn = null; PreparedStatement pstmt = null; try { conn =
 * DBConnection.makeConnection(); conn.setAutoCommit(false);
 * 
 * //step 증가 StringBuffer update_step = new StringBuffer();
 * update_step.append("update reboard \n");
 * update_step.append("set step = step + 1 \n");
 * update_step.append("where ref = ? and step > ?"); pstmt =
 * conn.prepareStatement(update_step.toString()); pstmt.setInt(1,
 * BoardDto.getRef()); pstmt.setInt(2, BoardDto.getStep());
 * pstmt.executeUpdate(); pstmt.close();
 * 
 * //답글쓰기 StringBuffer insert_reply = new StringBuffer();
 * insert_reply.append("insert all \n"); insert_reply.
 * append("	into board (seq, name, id, email, subject, content, hit, logtime, bcode) \n"
 * ); insert_reply.append("	values (?, ?, ?, ?, ?, ?, 0, sysdate, ?) \n");
 * insert_reply.
 * append("	into reboard (rseq, seq, ref, lev, step, pseq, reply) \n");
 * insert_reply.append("	values (reboard_rseq.nextval, ?, ?, ?, ?, ?, 0) \n"
 * ); insert_reply.append("select * from dual"); pstmt =
 * conn.prepareStatement(insert_reply.toString()); int idx = 0;
 * pstmt.setInt(++idx, BoardDto.getSeq()); pstmt.setString(++idx,
 * BoardDto.getName()); pstmt.setString(++idx, BoardDto.getId());
 * pstmt.setString(++idx, BoardDto.getEmail()); pstmt.setString(++idx,
 * BoardDto.getSubject()); pstmt.setString(++idx, BoardDto.getContent());
 * pstmt.setInt(++idx, BoardDto.getBcode()); pstmt.setInt(++idx,
 * BoardDto.getSeq()); pstmt.setInt(++idx, BoardDto.getRef());
 * pstmt.setInt(++idx, BoardDto.getLev() + 1); pstmt.setInt(++idx,
 * BoardDto.getStep() + 1); pstmt.setInt(++idx, BoardDto.getPseq());
 * pstmt.executeUpdate(); pstmt.close();
 * 
 * //답글수 증가 StringBuffer update_reply = new StringBuffer();
 * update_reply.append("update reboard \n");
 * update_reply.append("set reply = reply + 1 \n");
 * update_reply.append("where seq = ?"); pstmt =
 * conn.prepareStatement(update_reply.toString()); pstmt.setInt(1,
 * BoardDto.getPseq()); pstmt.executeUpdate();
 * 
 * conn.commit(); cnt = 1; } catch (SQLException e) { e.printStackTrace(); try {
 * conn.rollback(); cnt = 0; } catch (SQLException e1) { e1.printStackTrace(); }
 * } finally { DBClose.close(conn, pstmt); } return cnt; }
 * 
 * 
 * 
 * 
 * 
 */
