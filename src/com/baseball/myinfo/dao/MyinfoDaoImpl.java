package com.baseball.myinfo.dao;

import java.sql.*;

import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class MyinfoDaoImpl implements MyinfoDao {

	private static MyinfoDao myinfoDao;
	
	static {
		myinfoDao = new MyinfoDaoImpl();
	}
	
	private MyinfoDaoImpl() {
	}

	public static MyinfoDao getMyinfoDao() {
		return myinfoDao;
	}


	@Override
	public int updateRookie(String mid, int price) {
		//루키값업데이트!
		System.out.println("MyinfoDaoImpl 진입!");
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE member_detail \n");
			sql.append("SET rookie = rookie + ? \n");
			sql.append("WHERE mid = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, price);
			pstmt.setString(2, mid);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		System.out.println("DaoImpl 결과cnt >>>>>>" + cnt);
		return cnt;
	}

	@Override
	public String getMyTname(int mtno) {
		System.out.println("MyinfoDaoImpl 진입!");
		String tname = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select tname from team where tno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, mtno);
			rs = pstmt.executeQuery();
			rs.next();
			tname = rs.getString("tname");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return tname;
	}
	@Override
	public int getMyRookie(String mid) {
		System.out.println("MyinfoDaoImpl 진입!");
		int rookie = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select rookie from member_detail where mid = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			rookie = rs.getInt("rookie");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return rookie;
	}

	@Override
	public String getMyEmblem(int mtno) {
		System.out.println("MyinfoDaoImpl myemblem 진입!");
		String emblem = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select emblem from team where tno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, mtno);
			rs = pstmt.executeQuery();
			rs.next();
			emblem = rs.getString("emblem");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return emblem;
	}
}
