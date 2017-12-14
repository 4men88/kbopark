package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class AuctionCategoryDaoImpl implements AuctionCategoryDao {
	
	private static AuctionCategoryDao auctionCategoryDao;

	static {
		auctionCategoryDao = new AuctionCategoryDaoImpl();
	}
	
	public static AuctionCategoryDao getAuctionCategoryDao() {
		return auctionCategoryDao;
	}

	@Override
	public List<AuctionDetailDto> auctionCategoryList(Map<String, String> map) {
		
	
		List<AuctionDetailDto> list = new ArrayList<AuctionDetailDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer category_all = new StringBuffer();
			category_all.append("select rr.*, COUNT(*) AS allcount \n");
			category_all.append("    from( \n");
			category_all.append("    select rownum rn, r.*        \n");
			category_all.append("    from( \n");
			category_all.append("        select a_ad.aname, to_char(a_ad.endtime, 'yyyy.mm.dd.hh24.mi.ss') as endtime, to_char(a_ad.starttime, 'yyyy.mm.dd.hh24.mi.ss') as starttime,\n"); 
			category_all.append("				a_ad.bidprice,a_ad.bidnum, ai.aimage, a_ad.astatus, a_ad.ano, a_ad.acount \n");
			category_all.append("        from auction_image ai,( \n");
			category_all.append("                                select a.*, NVL(ad.bidprice,0)as bidprice, NVL(ad.bidnum,0) as bidnum \n");
			category_all.append("                                from auction a,( \n");
			category_all.append("                                                select ano, max(bidprice) as bidprice, count(*) as bidnum \n");
			category_all.append("                                                from auction_detail \n");
			category_all.append("                                                group by ano \n");
			category_all.append("                                                )ad \n");
			category_all.append("                                where a.ano = ad.ano(+) \n");
			category_all.append("                                )a_ad \n");
			String category1 = map.get("category1");
			String category2 = map.get("category2");
			if(category1.isEmpty())	// ��з� ī�װ��� ������
			{
				category_all.append("where a_ad.astatus = ? and a_ad.ano = ai.ano(+)\n"); // ��ü����
			}
			else if(category2.isEmpty()) //��з��� �ְ� �Һз��� ������
			{
				category_all.append("where a_ad.astatus = ? and a_ad.ano = ai.ano(+) and a_ad.category1 = ?\n");
//				category_all.append("case when a_ad.category1 = ? \n");

			}
			else // ��з� �Һз� �Ѵ� ������ 
			{				
				category_all.append("where a_ad.astatus = ? and a_ad.ano = ai.ano(+) and a_ad.category1 = ? and a_ad.category2 = ?\n");
			}
			String gudan = map.get("gudan");
			if(!gudan.isEmpty())
				category_all.append(" and a_ad.tno = ? \n");
			String sort = map.get("sort");
			if(sort.equals("1"))
				category_all.append("order by a_ad.bidnum desc\n");	// �α��ż� -  ������ ���� �� 
			else if(sort.equals("2"))
				category_all.append("order by a_ad.endtime \n");	// �����ӹڼ�
			else if(sort.equals("3"))
				category_all.append("order by a_ad.starttime desc \n");	// �ű԰�ż�
			else if(sort.equals("4"))
				category_all.append("order by a_ad.acount desc \n");	// ��ȸ������
			else if(sort.equals("5"))
				category_all.append("order by a_ad.acount \n");	// ��ȸ������
			else if(sort.equals("6"))
				category_all.append("order by a_ad.bidprice desc \n");	// �������� ������
			else if(sort.equals("7"))
				category_all.append("order by a_ad.bidprice \n");	// �������� ������ 
			category_all.append("        )r \n");
			category_all.append("    where rownum <= ?\n");
			category_all.append("    )rr \n");
			category_all.append("where rr.rn > ?\n");
			pstmt = conn.prepareStatement(category_all.toString());
			int idx = 0;
			pstmt.setString(++idx,map.get("astatus"));
			if(!category1.isEmpty())	// ��з� ī�װ��� �ְ�
			{
				pstmt.setString(++idx,category1);
				if(!category2.isEmpty()) //�Һз� ī�װ��� ������
				{
					pstmt.setString(++idx,category2);
				}
			}
			if(!gudan.isEmpty())
			{
				pstmt.setString(++idx, gudan);
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			rs = pstmt.executeQuery();
			System.out.println("rs       = " + rs );
			int cnt = 0;
			while(rs.next()) {
				System.out.println("ī�װ� �ؽ�Ʈ");
				AuctionDetailDto auctionDetailDto = new AuctionDetailDto();
				auctionDetailDto.setAname(rs.getString("aname"));
				auctionDetailDto.setEndTime(rs.getString("endtime"));
				auctionDetailDto.setStartTime(rs.getString("starttime"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				auctionDetailDto.setBidNum(rs.getInt("bidnum"));
				auctionDetailDto.setAimage(rs.getString("aimage"));
				auctionDetailDto.setAstatus(rs.getInt("astatus"));
				auctionDetailDto.setAno(rs.getInt("ano"));
				list.add(auctionDetailDto);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println("ī�װ� ������ : " + list.size());
		return list;
	}
}
