package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class AuctionCommonDaoImpl implements AuctionCommonDao {

	private static AuctionCommonDao auctionCommonDao;

	static {
		auctionCommonDao = new AuctionCommonDaoImpl();
	}
	
	public static AuctionCommonDao getAuctionCommonDao() {
		return auctionCommonDao;
	}
	@Override
	public void auctionHitUpdate(int ano) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql1 = new StringBuffer();
			
			sql1.append("update auction \n");
			sql1.append("set acount = acount + 1 \n");
			sql1.append("where ano = ?");
			pstmt = conn.prepareStatement(sql1.toString());
			pstmt.setInt(1,ano);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}
}
