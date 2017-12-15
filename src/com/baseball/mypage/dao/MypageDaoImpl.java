package com.baseball.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.baseball.auction.model.AuctionDto;
import com.baseball.member.dao.MemberDao;
import com.baseball.member.dao.MemberDaoImpl;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.model.MemberDto;
import com.baseball.util.db.DBConnection;

public class MypageDaoImpl implements MypageDao {

	private static MypageDao mypageDao;
	private PreparedStatement pstmt2;
	
	static {
		
		mypageDao = new MypageDaoImpl();
		
	}
	
	private MypageDaoImpl() {}
	
	public static MypageDao getMypageDao() {
		return mypageDao;
	}

	
	
	
	
	
	@Override
	public MemberDetailDto myInfo(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyInfo(MemberDetailDto memberDto) {
		Connection conn = null;
<<<<<<< HEAD
		PreparedStatement pstmt1 = null;
		
		int cnt1 = 0;
		
=======
		PreparedStatement pstmt = null;
		PreparedStatement pstmt3 = null;
		int cnt = 0;
>>>>>>> dea173dce3d466e73643cd3e951b710f15ecf46f
		try {
			System.out.println("MypageDaoImpl>>>>>>>>modifyinfo1 실행 ");
			conn=DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
		
			sql.append("update member\n");
			sql.append("set pass=?,name=?,email1=?,email2=? \n");
			sql.append("where mid=?");
			pstmt1 = conn.prepareStatement(sql.toString());
			int idx=0;
<<<<<<< HEAD
			pstmt1.setString(++idx, memberDto.getPass());
			pstmt1.setString(++idx, memberDto.getName());
			pstmt1.setString(++idx, memberDto.getEmail1());
			pstmt1.setString(++idx, memberDto.getEmail2());
			pstmt1.setString(++idx, memberDto.getId());
			cnt1=pstmt1.executeUpdate();
			System.out.println("memberDetaildto>>>modifyinfo>>>member 테이블 완료==="+cnt1);
			} catch (SQLException e) {
			e.printStackTrace();
			}finally {
			DBClose.close(conn, pstmt1);	
			}
		
			conn = null;
			PreparedStatement pstmt2 = null;
			int cnt2 =0;
			try {
				System.out.println("MypageDaoImpl>>>>>>>>modifyinfo2 실행");
				conn=DBConnection.makeConnection();
				
				StringBuffer sql2 = new StringBuffer();
							
				int idx2=0;
				sql2.append("update member_detail \n");
				sql2.append("set tel1 = ?, tel2 = ?, tel3 = ?, zip1 = ?, addr1 = ?, addr2 = ?, tno= ? \n");
				sql2.append("where mid = ?");
				
				pstmt2= conn.prepareStatement(sql2.toString());
				pstmt2.setString(++idx2, memberDto.getTel1());
				pstmt2.setString(++idx2, memberDto.getTel2());
				pstmt2.setString(++idx2, memberDto.getTel3());
				pstmt2.setString(++idx2, memberDto.getZip1());
				pstmt2.setString(++idx2, memberDto.getAddr1());
				pstmt2.setString(++idx2, memberDto.getAddr2());
				pstmt2.setInt(++idx2, memberDto.getTno());
				pstmt2.setString(++idx2, memberDto.getId());
				cnt2=pstmt2.executeUpdate();
				System.out.println("memberDetaildto>>>modifyinfo>>>member_detail 테이블 완료==="+cnt2);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DBClose.close(conn, pstmt2);	
			}
				
		return cnt1*cnt2;
=======
			pstmt.setString(++idx, memberDto.getPass());
			pstmt.setString(++idx, memberDto.getName());
			pstmt.setString(++idx, memberDto.getEmail1());
			pstmt.setString(++idx, memberDto.getEmail2());
			pstmt.setString(++idx, memberDto.getId());
			cnt=pstmt.executeUpdate();
			System.out.println("memberDetaildto>>>modifyinfo>>>member 테이블 완료==="+cnt);
			cnt=0;
			sql2.append("update member_dateil");
			sql2.append("set tel1=?, tel2=?, tel3=?, zip1=?, addr1=?, addr2=?, tno=?");
			sql2.append("where mid=?");
			idx=0;
			
			pstmt3= conn.prepareStatement(sql.toString());
			pstmt3.setString(++idx, memberDto.getTel1());
			pstmt3.setString(++idx, memberDto.getTel2());
			pstmt3.setString(++idx, memberDto.getTel3());
			pstmt3.setString(++idx, memberDto.getZip1());
			pstmt3.setString(++idx, memberDto.getAddr1());
			pstmt3.setString(++idx, memberDto.getAddr2());
			pstmt3.setInt(++idx, memberDto.getTno());
			pstmt3.setString(++idx, memberDto.getId());
			cnt=pstmt3.executeUpdate();
			System.out.println("memberDetaildto>>>modifyinfo>>>member_detail 테이블 완료==="+cnt);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cnt;
>>>>>>> dea173dce3d466e73643cd3e951b710f15ecf46f
			
	}

	@Override
	public AuctionDto selling(MemberDto memberDto) {
		
		return null;
	}

	@Override
	public AuctionDto buying(MemberDto memberDto) {
		
		return null;
	}

}
