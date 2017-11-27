package com.baseball.schedule.scheduledao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class ScheduleDaoImpl implements ScheduleDao {
	
	private static ScheduleDao scheduleDao;
	
	static {
		scheduleDao = new ScheduleDaoImpl();
	}
	
	private ScheduleDaoImpl() {
		
	}

	
	public static ScheduleDao getScheduleDao() {
		return scheduleDao;
	}

	@Override
	public ScheduleDto getSchedule(ScheduleDto scheduleDto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select p.playdate, s.sname, t.tname, t.emblem, p.score1, p.score2, p.pstatus \n");
			sql.append("from plan p, stadium s, team t \n");
//			sql.append("\n");
//			sql.append("\n");
//			sql.append("\n");
//			sql.append("\n");
//			sql.append("\n");
		
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()){
				scheduleDto.setPlaydate(rs.getDate("playdate"));
				scheduleDto.setSname(rs.getString("sname"));
				scheduleDto.setTname(rs.getString("tname"));
				scheduleDto.setEmblem(rs.getString("emblem"));
				scheduleDto.setScore1(rs.getInt("score1"));
				scheduleDto.setScore2(rs.getInt("score2"));
				scheduleDto.setPstatus(rs.getString("pstatus"));
				System.out.println("ScheduleDaoImpl"+ scheduleDto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return scheduleDto;
	}

}
