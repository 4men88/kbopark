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
			sql.append("select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, a_ad.bidprice, a_ad.bidnum, ai.aimage, a_ad.astatus, a_ad.ano\n");
			sql.append("from auction_image ai,( \n");
			sql.append("                        select a.*, ad.bidprice, ad.bidnum\n");
			sql.append("                        from auction a,( \n");
			sql.append("                                        select ano, max(bidprice) as bidprice, count(*) as bidnum \n");
			sql.append("                                        from auction_detail \n");
			sql.append("                                        group by ano \n");
			sql.append("                                        )ad \n");
			sql.append("                        where astatus = 1 and a.ano = ad.ano \n");
			sql.append("                        )a_ad \n");
			sql.append("where a_ad.ano = ai.ano \n");
			sql.append("order by a_ad.bidnum desc\n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int cnt = 0;
			while(rs.next()) {
				System.out.println("넥스트 들어옴");
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
		System.out.println("bestlist 사이즈 : " + list.size());
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
				System.out.println("넥스트 들어옴");
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
		System.out.println("endlist 사이즈 : " + list.size());
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
				System.out.println("넥스트 들어옴");
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
		System.out.println("hitlist 사이즈 : " + list.size());
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
				System.out.println("넥스트 들어옴");
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
		System.out.println("newlist 사이즈 : " + list.size());
		return list;
	}

	@Override
	public List<Integer> auctionNewNumArray() {
		int cnt = 0;
		List<Integer> list = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			// 전체보기 오늘 등록된 개수
			sql.append("select count(*) as count \n");
			sql.append("from auction \n");
			sql.append("where starttime = sysdate \n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			list.add(rs.getInt("count"));
			
			// 유니폼 오늘 등록된 개수
			StringBuffer sql2 = new StringBuffer();
			sql2.append("select count(*) as count\n");
			sql2.append("from auction\n");
			sql2.append("where starttime = sysdate and category1 ='유니폼'\n");
			pstmt = conn.prepareStatement(sql2.toString());
			rs = pstmt.executeQuery();
			rs.next();
			list.add(rs.getInt("count"));
			
			// 경기용품 오늘 등록된 개수
			StringBuffer sql3 = new StringBuffer();
			sql3.append("select count(*) as count\n");
			sql3.append("from auction\n");
			sql3.append("where starttime = sysdate and category1 ='경기용품'\n");
			pstmt = conn.prepareStatement(sql3.toString());
			rs = pstmt.executeQuery();
			rs.next();
			list.add(rs.getInt("count"));
			
			// 응원용품 오늘 등록된 개수
			StringBuffer sql4 = new StringBuffer();
			sql4.append("select count(*) as count\n");
			sql4.append("from auction\n");
			sql4.append("where starttime = sysdate and category1 ='응원용품'\n");
			pstmt = conn.prepareStatement(sql4.toString());
			rs = pstmt.executeQuery();
			rs.next();
			list.add(rs.getInt("count"));
			
			// 기타잡화 오늘 등록된 개수
			StringBuffer sql5 = new StringBuffer();
			sql5.append("select count(*) as count\n");
			sql5.append("from auction\n");
			sql5.append("where starttime = sysdate and category1 ='기타잡화'\n");
			pstmt = conn.prepareStatement(sql5.toString());
			rs = pstmt.executeQuery();
			rs.next();
			list.add(rs.getInt("count"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
				cnt = 0;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt,rs);
		}
		System.out.println("numarray 사이즈 : " + list.size());
		return list;
	}
}
