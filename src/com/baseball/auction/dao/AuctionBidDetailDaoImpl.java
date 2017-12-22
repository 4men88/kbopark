package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public List<AuctionDetailDto> auctionBidDetailList(int ano) {
		
		List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
		
		
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			//  ÀÔÂûÀÚ ¸¹Àº¼ø
			sql.append("select ad.rn, ad.ano, ad.mid, ad.bidprice, to_char(ad.biddate, 'yyyy.mm.dd.hh24.mi.ss') as biddate\n");
			sql.append("	from(\n");
			sql.append("		select rownum rn, auction_detail.*\n");
			sql.append("        from auction_detail\n");
			sql.append("        where ano = ?\n");
			sql.append("        order by biddate \n");
			sql.append("        )ad \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,ano);
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

}
