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
}
