package com.baseball.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baseball.board.model.ReplyDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;


public class ReplyDaoImpl implements ReplyDao {

	private static ReplyDao ReplyDao;
	
	static {
		ReplyDao = new ReplyDaoImpl();
	}
	
	private ReplyDaoImpl() {}
		
	public static ReplyDao getReplyDao() {
		return ReplyDao;
	}

	@Override
	public void writeReply(ReplyDto ReplyDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into board_reply (reno, bno, mid, replyname, recontent, retime) \n");
			sql.append("values (reply_seq.nextval, ?, ?, ?, ?, sysdate)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, ReplyDto.getBno());
			pstmt.setString(2, ReplyDto.getMid());
			pstmt.setString(3, ReplyDto.getReplyname());
			pstmt.setString(4, ReplyDto.getRecontent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public List<ReplyDto> listReply(int seq) {
		List<ReplyDto> list = new ArrayList<ReplyDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select reno, bno, mid, replyname, recontent, \n");
			sql.append("		decode(to_char(retime, 'yymmdd'), ");
			sql.append("				to_char(sysdate, 'yymmdd'), to_char(retime, 'hh24:mi:ss'), ");
			sql.append("				to_char(retime, 'yy.mm.dd')) retime \n");
			sql.append("from reply \n");
			sql.append("where bno = ? \n");
			sql.append("order by retime desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyDto replyDto = new ReplyDto();
				replyDto.setReno(rs.getInt("reno"));
				replyDto.setBno(rs.getInt("bno"));
				replyDto.setMid(rs.getString("mid"));
				replyDto.setReplyname(rs.getString("replyname"));
				replyDto.setRecontent(rs.getString("recontent"));
				replyDto.setRetime(rs.getString("retime"));
				
				list.add(replyDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public void deleteReply(int reno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete reply \n");
			sql.append("where reno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, reno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

}
