package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.auction.service.AuctionCategoryService;
import com.baseball.auction.service.AuctionCategoryServiceImpl;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class AuctionBidDetailDaoImpl implements AuctionBidDetailDao {

	private static AuctionBidDetailDao auctionBidDetailDao;
	
	static {
		auctionBidDetailDao = new AuctionBidDetailDaoImpl();
	}
	
	public static AuctionBidDetailDao getAuctionBidDetailDao() {
		return auctionBidDetailDao;
	}
	
	@Override
	public List<AuctionDetailDto> auctionBidDetailList(Map<String, String> map) {
		
		List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql2 = new StringBuffer();
			
			String ano = map.get("ano");
			//  ÀÔÂûÀÚ ¸¹Àº¼ø
			sql2.append("select a.*\n");
			sql2.append("	from(\n");
			sql2.append("		select rownum rn, ad.ano, ad.mid, ad.bidprice, to_char(ad.biddate, 'yyyy.mm.dd.hh24.mi.ss') as biddate\n");
			sql2.append("		from(\n");
			sql2.append("			select auction_detail.*\n");
			sql2.append("        	from auction_detail\n");
			sql2.append("        	where ano = ?\n");
			sql2.append("        	order by biddate \n");
			sql2.append("        	)ad \n");
			sql2.append("        where rownum <= ? \n");
			sql2.append("        )a \n");
			sql2.append("    where a.rn > ? \n");
			pstmt = conn.prepareStatement(sql2.toString());
			pstmt.setString(1,ano);
			String end = map.get("end");
			String start = map.get("start");
			pstmt.setString(2,end);
			pstmt.setString(3,start);
			rs = pstmt.executeQuery();

			int cnt = 0;
			while(rs.next()) {
				System.out.println("³Ø½ºÆ® µé¾î¿È");
				AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
				auctionDetailDto.setBno(rs.getInt("rn"));
				auctionDetailDto.setAno(rs.getInt("ano"));
				auctionDetailDto.setMid(rs.getString("mid"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				auctionDetailDto.setBidDate(rs.getString("biddate"));
				list.add(auctionDetailDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println("ÀÔÂûÁ¤º¸ ¼ýÀÚ : " + list.size());
		return list;
	}

	@Override
	public int totalBidCount(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) as count\n");
			sql.append("from auction_detail \n");
			sql.append("where ano = ? \n");
//			String word = map.get("word");
//			if(!word.isEmpty()) {
//				String key = map.get("key");
//				if("subject".equals(key)) {
//					sql.append("and subject like '%'||?||'%'");
//				} else {
//					sql.append("and " + key + " = ? \n");
//				}
//			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, map.get("ano"));
//			if(!word.isEmpty())
//				pstmt.setString(2, word);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}
}
