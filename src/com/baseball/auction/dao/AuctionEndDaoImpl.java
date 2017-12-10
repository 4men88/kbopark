package com.baseball.auction.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.baseball.auction.model.AuctionDetailDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;


public class AuctionEndDaoImpl implements AuctionEndDao {

	private static AuctionEndDao auctionEndDao;

	static {
		auctionEndDao = new AuctionEndDaoImpl();
	}
	
	public static AuctionEndDao getAuctionEndDao() {
		return auctionEndDao;
	}

	@Override
	public int auctionStatusEnd(String ano) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			//��Ż��� ����� ����
			StringBuffer astatus_change = new StringBuffer();
			astatus_change.append("update auction \n");
			astatus_change.append("set astatus = 1 \n");
			astatus_change.append("where ano = ?");
			pstmt = conn.prepareStatement(astatus_change.toString());
			pstmt.setString(1,ano);
			pstmt.executeUpdate();
			pstmt.close();
			
			// ����ȸ�� ã��
			StringBuffer successful_bid = new StringBuffer();	
			 //biddate �߰�
			successful_bid.append("select  auction_detail.ano, auction_detail.mid,  auction_detail.bidprice\n");
			successful_bid.append("from auction_detail, (\n");
			successful_bid.append("                      select ano, max(bidprice) as bidprice \n");
			successful_bid.append("                      from auction_detail \n");
			successful_bid.append("                      where ano = ? \n");
			successful_bid.append("                      group by ano\n");
			successful_bid.append("                      ) ad\n");
			successful_bid.append("where  auction_detail.ano = ad.ano and  auction_detail.bidprice = ad.bidprice");
			pstmt = conn.prepareStatement(successful_bid.toString());
			pstmt.setString(1,ano);
			rs = pstmt.executeQuery();
			if(rs.next())	//�����ڰ� ������츸
			{
				AuctionDetailDto auctionDetailDto  = new AuctionDetailDto();
				auctionDetailDto.setAno(rs.getInt("ano"));
				auctionDetailDto.setMid(rs.getString("mid"));
				auctionDetailDto.setBidPrice(rs.getInt("bidprice"));
				
				//��ſϷ�� ���̺� �μ�Ʈ 
				StringBuffer insert_successful_bid_result = new StringBuffer();	
				//��ſϷ�� ���̺� �����ð�(RBIDDATE) �÷� �߰��� -> ��Ű�󼼿� �Ͻ�(paydate)DATE�� insert�Ҷ� �ʿ� 
				insert_successful_bid_result.append("insert into auction_result(ano, mid, finalprice, rbiddate ) \n");
				insert_successful_bid_result.append("values(?, ?, ?, sysdate)");
				pstmt = conn.prepareStatement(insert_successful_bid_result.toString());
				pstmt.setInt(1, auctionDetailDto.getAno());
				pstmt.setString(2,auctionDetailDto.getMid());
				pstmt.setInt(3,auctionDetailDto.getBidPrice());
				pstmt.executeUpdate();
				pstmt.close();
				
				//ȸ���� ���̺��� ������ ��Ű ���ҽ�Ű��
				StringBuffer finalprice_minus = new StringBuffer();	
				finalprice_minus.append("update member_detail \n");
				finalprice_minus.append("set rookie = rookie - ?");
				finalprice_minus.append("where mid = ?");
				pstmt = conn.prepareStatement(finalprice_minus.toString());
				pstmt.setInt(1,auctionDetailDto.getBidPrice());
				pstmt.setString(2, auctionDetailDto.getMid());
				pstmt.executeUpdate();
				pstmt.close();
				
				//��Ű�� ���̺� �������� �μ�Ʈ
				StringBuffer insert_rookie_detail = new StringBuffer();	
				insert_rookie_detail.append("insert into rookie_detail(mid, price, paydate, rtype, rdetail)");
				insert_rookie_detail.append("values(?, ?, sysdate, '2', '����')");
				pstmt = conn.prepareStatement(insert_rookie_detail.toString());
				pstmt.setString(1, auctionDetailDto.getMid());
				pstmt.setInt(2,auctionDetailDto.getBidPrice());
				pstmt.executeUpdate();
				pstmt.close();
				
				conn.commit();
				cnt = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
				cnt = 0;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}
}
