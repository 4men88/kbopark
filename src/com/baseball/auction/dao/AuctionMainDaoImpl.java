package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class AuctionMainDaoImpl implements AuctionMainDao {

	private static AuctionMainDao auctionDao;
	
	static {
		auctionDao = new AuctionMainDaoImpl();
	}
	
	
	public static AuctionMainDao getAuctionDao() {
		return auctionDao;
	}
	
	@Override
	public List<AuctionDetailDto> auctionBestList() {
	List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
<<<<<<< HEAD:src/com/baseball/auction/dao/AuctionMainDaoImpl.java
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yy.mm.dd.hh24:mi:ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage ");
=======
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage ");
>>>>>>> c3132dd986e08b66791fca3e2b011bf72e954aa1:src/com/baseball/auction/dao/AuctionDaoImpl.java
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum \n");
			sql.append("                        from auction a,( \n");
			sql.append("                                        select ano, max(bidprice) as bidprice, count(*) as bidnum \n");
			sql.append("                                        from auction_detail \n");
			sql.append("                                        group by ano \n");
			sql.append("                                        )ad \n");
			sql.append("                        where astatus = 1 and a.ano = ad.ano \n");
			sql.append("                        )a_ad \n");
			sql.append("where a_ad.ano = ai.ano \n");
			sql.append("order by a_ad.bidnum desc");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int cnt = 0;
			while(rs.next()) {
				System.out.println("≥ÿΩ∫∆Æ µÈæÓø»");
				AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
				auctionDetailDto.setAname(rs.getString("aname"));
				auctionDetailDto.setEndTime(rs.getString("endtime"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				auctionDetailDto.setBidNum(rs.getInt("bidnum"));
				auctionDetailDto.setAimage(rs.getString("aimage"));
				
				list.add(auctionDetailDto);
				if(++cnt == 4)
					break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("rs ============ " + rs );
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println("list ªÁ¿Ã¡Ó : " + list.size());
		return list;
	}
	
	@Override
	public  List<AuctionDetailDto> auctionEndList() {
		List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyymmdd hh24:mi:ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage \n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum \n");
			sql.append("                        from auction a,( \n");
			sql.append("                                        select ano, max(bidprice) as bidprice, count(*) as bidnum \n");
			sql.append("                                        from auction_detail \n");
			sql.append("                                        group by ano \n");
			sql.append("                                        )ad \n");
			sql.append("                        where astatus = 1 and a.ano = ad.ano \n");
			sql.append("                        )a_ad \n");
			sql.append("where a_ad.ano = ai.ano \n");
			sql.append("order by a_ad.endtime");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int cnt = 0;
			while(rs.next()) {
				System.out.println("≥ÿΩ∫∆Æ µÈæÓø»");
				AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
				auctionDetailDto.setAname(rs.getString("aname"));
				auctionDetailDto.setEndTime(rs.getString("endtime"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				auctionDetailDto.setBidNum(rs.getInt("bidnum"));
				auctionDetailDto.setAimage(rs.getString("aimage"));
				
				list.add(auctionDetailDto);
				if(++cnt == 4)
					break;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("rs ============ " + rs );
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println("list ªÁ¿Ã¡Ó : " + list.size());
		return list;
	}

	@Override
	public List<AuctionDetailDto> auctionHitList() {
	List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyymmdd hh24:mi:ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage \n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum \n");
			sql.append("                        from auction a,( \n");
			sql.append("                                        select ano, max(bidprice) as bidprice, count(*) as bidnum \n");
			sql.append("                                        from auction_detail \n");
			sql.append("                                        group by ano \n");
			sql.append("                                        )ad \n");
			sql.append("                        where astatus = 1 and a.ano = ad.ano \n");
			sql.append("                        )a_ad \n");
			sql.append("where a_ad.ano = ai.ano \n");
			sql.append("order by a_ad.acount desc");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int cnt = 0;
			while(rs.next()) {
				System.out.println("≥ÿΩ∫∆Æ µÈæÓø»");
				AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
				auctionDetailDto.setAname(rs.getString("aname"));
				auctionDetailDto.setEndTime(rs.getString("endtime"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				auctionDetailDto.setBidNum(rs.getInt("bidnum"));
				auctionDetailDto.setAimage(rs.getString("aimage"));
				
				list.add(auctionDetailDto);
				if(++cnt == 4)
					break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("rs ============ " + rs );
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println("list ªÁ¿Ã¡Ó : " + list.size());
		return list;
	}

	@Override
	public List<AuctionDetailDto> auctionNewList() {
	List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyymmdd hh24:mi:ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage \n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum \n");
			sql.append("                        from auction a,( \n");
			sql.append("                                        select ano, max(bidprice) as bidprice, count(*) as bidnum \n");
			sql.append("                                        from auction_detail \n");
			sql.append("                                        group by ano \n");
			sql.append("                                        )ad \n");
			sql.append("                        where astatus = 1 and a.ano = ad.ano \n");
			sql.append("                        )a_ad \n");
			sql.append("where a_ad.ano = ai.ano \n");
			sql.append("order by a_ad.starttime desc");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int cnt = 0;
			while(rs.next()) {
				System.out.println("≥ÿΩ∫∆Æ µÈæÓø»");
				AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
				auctionDetailDto.setAname(rs.getString("aname"));
				auctionDetailDto.setEndTime(rs.getString("endtime"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				auctionDetailDto.setBidNum(rs.getInt("bidnum"));
				auctionDetailDto.setAimage(rs.getString("aimage"));
				
				list.add(auctionDetailDto);
				if(++cnt == 4)
					break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("rs ============ " + rs );
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println("list ªÁ¿Ã¡Ó : " + list.size());
		return list;
	}

}
