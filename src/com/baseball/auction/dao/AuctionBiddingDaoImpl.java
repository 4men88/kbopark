package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class AuctionBiddingDaoImpl implements AuctionBiddingDao {

private static AuctionBiddingDao auctionBiddingDao;
	
	static {
		auctionBiddingDao = new AuctionBiddingDaoImpl();
	}
	
	public static AuctionBiddingDao getAuctionBiddingDao() {
		return auctionBiddingDao;
	}
	
	@Override
	public void auctionAddBid(Map<String, String> map) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			//입찰루키 감소
			StringBuffer rookie_change = new StringBuffer();
			rookie_change.append("update member_detail \n");
			rookie_change.append("set rookie = ? \n");
			rookie_change.append("where id = ?");
			pstmt = conn.prepareStatement(rookie_change.toString());			
			String rookie = map.get("rookie");
			String id = map.get("id");
			pstmt.setString(1,rookie);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
			pstmt.close();
				
			//루키상세 테이블에서 입찰자 루키 감소시키고
			StringBuffer insert_rookie_detail = new StringBuffer();	
			insert_rookie_detail.append("insert into rookie_detail(mid, price, paydate, rtype, rdetail)");
			insert_rookie_detail.append("values(?, ?, sysdate, '2', '입찰')");
			pstmt = conn.prepareStatement(insert_rookie_detail.toString());
			pstmt.setString(1, id);
			String bidRookie = map.get("bidRookie");
			pstmt.setString(2, bidRookie);
			pstmt.executeUpdate();
			pstmt.close();
			
			//경매입찰상세 테이블에 입찰내역 인서트
			StringBuffer insert_auction_detail = new StringBuffer();	
			insert_auction_detail.append("insert into auction_detail(ano, mid, bidprice, biddate)\n");
			insert_auction_detail.append("values(?, ?, ?, sysdate)");
			pstmt = conn.prepareStatement(insert_auction_detail.toString());
			String ano = map.get("ano");
			pstmt.setString(1, ano);
			pstmt.setString(2, id);
			pstmt.setString(3, bidRookie);
			pstmt.executeUpdate();
			pstmt.close();
			
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
	}
}
