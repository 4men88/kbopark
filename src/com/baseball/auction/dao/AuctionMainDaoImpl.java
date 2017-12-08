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

	private static AuctionMainDao auctionMainDao;
	
	static {
		auctionMainDao = new AuctionMainDaoImpl();
	}
	
	
	public static AuctionMainDao getAuctionMainDao() {
		return auctionMainDao;
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
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage, a_ad.astatus, a_ad.ano");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum, a.astatus, a.ano \n");
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
				auctionDetailDto.setAstatus(rs.getInt("astatus"));
				auctionDetailDto.setAno(rs.getInt("ano"));
				
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
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage, a_ad.astatus, a_ad.ano \n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum, a.astatus, a.ano \n");
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
				auctionDetailDto.setAstatus(rs.getInt("astatus"));
				auctionDetailDto.setAno(rs.getInt("ano"));
				
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
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage, a_ad.astatus, a_ad.ano \n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum, ,a.astatus, a.ano \n");
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
				auctionDetailDto.setAstatus(rs.getInt("astatus"));
				auctionDetailDto.setAno(rs.getInt("ano"));
				
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
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage, a_ad.astatus, a_ad.ano \n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum, a.status, a.ano \n");
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
				auctionDetailDto.setAstatus(rs.getInt("astatus"));
				auctionDetailDto.setAno(rs.getInt("ano"));
				
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
	public List<Integer> auctionNewNumArray() {
		List<Integer> list = null;
		return list;
	}

}
