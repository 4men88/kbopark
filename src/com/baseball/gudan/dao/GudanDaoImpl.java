package com.baseball.gudan.dao;

import java.sql.*;

import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class GudanDaoImpl implements GudanDao {

	private static GudanDao gudanDao;
	
	static {
		gudanDao = new GudanDaoImpl();
	}
	
	private GudanDaoImpl() {
	}

	public static GudanDao getGudanDao() {
		return gudanDao;
	}

	@Override
	public String getGudanWeb(int tno) {
		String web = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("GudanDaoImpl tno >>> " + tno);
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT web1 \n");
			sql.append("FROM team \n");
			sql.append("WHERE tno = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			rs = pstmt.executeQuery();
			rs.next();
			web = rs.getString("web1");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
			
		System.out.println("GudanDaoImpl web >>> " + web);
		return "http://www.naver.com";
	}
	
}
