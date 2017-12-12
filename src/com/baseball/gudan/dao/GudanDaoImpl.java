package com.baseball.gudan.dao;

import java.sql.*;

import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class GudanDaoImpl implements GudanDao {

	private static GudanDao gudanDao;
	
	static {
		gudanDao = new GudanDaoImpl();
	}
	
	private GudanDaoImpl() {
	}

	public static GudanDao getGudanDao() {
		return gudanDao;
	}

	@Override
	public String getGudanWeb(int tno) {
		String web = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("GudanDaoImpl tno >>> " + tno);
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT web1 \n");
			sql.append("FROM team \n");
			sql.append("WHERE tno = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			rs = pstmt.executeQuery();
			rs.next();
			web = rs.getString("web1");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
			
		System.out.println("GudanDaoImpl web >>> " + web);
		return web;
	}

	@Override
	public String getReservationWeb(int tno) {
		String web = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("GudanDaoImpl tno >>> " + tno);
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT web2 \n");
			sql.append("FROM team \n");
			sql.append("WHERE tno = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			rs = pstmt.executeQuery();
			rs.next();
			web = rs.getString("web2");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
			
		System.out.println("GudanDaoImpl web2 >>> " + web);
		return web;
	}

	@Override
	public GudanDto gudanArticle(int tno) {
		GudanDto gudanDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("GudanDaoImpl tno >>> " + tno);
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT tno, tname, emblem, sno1, sno2, web1, web2, enname \n");
			sql.append("FROM team \n");
			sql.append("WHERE tno = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				gudanDto = new GudanDto();
				gudanDto.setTno(rs.getInt("tno"));
				gudanDto.setTname(rs.getString("tname"));
				gudanDto.setEmblem(rs.getString("emblem"));
				gudanDto.setSno1(rs.getInt("sno1"));
				gudanDto.setSno2(rs.getInt("sno2"));
				gudanDto.setWeb1(rs.getString("web1"));
				gudanDto.setWeb2(rs.getString("web2"));
				gudanDto.setEnname(rs.getString("enname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return gudanDto;
	}

	@Override
	public StadiumDto stadiumArticle(int sno) {
		StadiumDto stadiumDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("GudanDaoImpl sno >>> " + sno);
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT sno, sname, sloc, image, lat, lng, locid \n");
			sql.append("FROM stadium \n");
			sql.append("WHERE sno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				stadiumDto = new StadiumDto();
				stadiumDto.setSno(rs.getInt("sno"));
				stadiumDto.setSname(rs.getString("sname"));
				stadiumDto.setSloc(rs.getString("sloc"));
				stadiumDto.setImage(rs.getString("image"));
				stadiumDto.setLat(rs.getDouble("lat"));
				stadiumDto.setLng(rs.getDouble("lng"));
				stadiumDto.setLocid(rs.getInt("locid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return stadiumDto;
	}
}
