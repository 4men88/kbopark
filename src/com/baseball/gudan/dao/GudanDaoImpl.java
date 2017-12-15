package com.baseball.gudan.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.baseball.gudan.model.GudanDto;
import com.baseball.gudan.model.StadiumDto;
import com.baseball.schedule.scheduleDto.ScheduleDto;
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

	@Override
	public ScheduleDto weeklyArticle(int tno, String day) {
		ScheduleDto scheduleDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();

			sql.append("select SUBSTR(C.myteam,1,INSTR(C.myteam,' ',1,1)-1) myteam,  \n");
			sql.append("		SUBSTR(t2.tname,1,INSTR(t2.tname,' ',1,1)-1) enteam, \n");
			sql.append("		C.sname, C.playtime, SUBSTR(C.playdate,1,1) playdate \n");
			sql.append("from (SELECT t1.tname myteam, B.* \n");
			sql.append("		FROM (select A.mytno, A.entno, s.sname, A.playtime, A.playdate \n");
			sql.append("				from (SELECT CASE WHEN tno1=? THEN tno1 ELSE tno2 END mytno,  \n");
			sql.append("				CASE WHEN tno2=? THEN tno1 ELSE tno2 END entno, \n");
			sql.append("				sno, to_char(playdate, 'hh24:mi') playtime, \n");
			sql.append("				to_char(playdate, 'day') playdate \n");
			sql.append("				from plan \n");
			sql.append("				WHERE (tno1 = ? OR tno2 = ?) \n");
			sql.append("				AND to_char(playdate, 'yymmdd') = ?) A, stadium s \n");
			sql.append("				where A.sno = s.sno) B, team t1 \n");
			sql.append("		WHERE B.mytno = t1.tno) C, team t2 \n");
			sql.append("where C.entno = t2.tno");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			pstmt.setInt(2, tno);
			pstmt.setInt(3, tno);
			pstmt.setInt(4, tno);
			pstmt.setString(5, day);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				scheduleDto = new ScheduleDto();
				scheduleDto.setHometeam(rs.getString("myteam"));
				scheduleDto.setAwayteam(rs.getString("enteam"));
				scheduleDto.setSname(rs.getString("sname"));
				scheduleDto.setPlaytime(rs.getString("playtime"));
				scheduleDto.setPlaydate(rs.getString("playdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		System.out.println("ÃÖÁ¾gudandaoimpl scheduledto >>> " + scheduleDto);
		return scheduleDto;
	}

	@Override
	public List<StadiumDto> weeklyStadium(int tno, String monday) {
		List<StadiumDto> list = new ArrayList<StadiumDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("GudanDaoImpl tno monday >>> " + tno + " " + monday);
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select s.sno, sname, sloc, image, lat, lng, locid \n");
			sql.append("from ( SELECT distinct sno \n");
			sql.append("    FROM plan \n");
			sql.append("    WHERE (tno1 = ? OR tno2 = ?) \n");
			sql.append("    AND playdate BETWEEN to_date(?, 'yymmdd') AND to_date(?, 'yymmdd')) A, stadium s \n");
			sql.append("where A.sno = s.sno");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			pstmt.setInt(2, tno);
			pstmt.setString(3, monday);
			pstmt.setString(4, (Integer.parseInt(monday)+7)+ "");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StadiumDto stadiumDto = new StadiumDto();
				stadiumDto.setSno(rs.getInt("sno"));
				stadiumDto.setSname(rs.getString("sname"));
				stadiumDto.setSloc(rs.getString("sloc"));
				stadiumDto.setImage(rs.getString("image"));
				stadiumDto.setLat(rs.getDouble("lat"));
				stadiumDto.setLng(rs.getDouble("lng"));
				stadiumDto.setLocid(rs.getInt("locid"));
				list.add(stadiumDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		System.out.println("stadiumlist size >> " + list.size());
		return list;
	}
}
