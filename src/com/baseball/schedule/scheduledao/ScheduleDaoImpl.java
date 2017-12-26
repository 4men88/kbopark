package com.baseball.schedule.scheduledao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baseball.schedule.scheduleDto.ScheduleDto;
import com.baseball.util.db.DBClose;
import com.baseball.util.db.DBConnection;

public class ScheduleDaoImpl implements ScheduleDao {

	private static ScheduleDao scheduleDao;

	static {
		scheduleDao = new ScheduleDaoImpl();
	}

	public static ScheduleDao getScheduleDao() {
		return scheduleDao;
	}

	@Override
	public List<ScheduleDto> getSchedule(String date) {
		//date = "20170831"
		List<ScheduleDto> list = new ArrayList<ScheduleDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT B.hometeam, B.awayteam, B.score1, B.score2, B.playdate, s.sname \n");
			sql.append("FROM (select A.tname hometeam, t2.tname awayteam, score1, score2, sno, playdate \n");
			sql.append("    from (SELECT tno1, tno2, score1, score2, tname, sno, TO_CHAR(playdate, 'yyyymmdd') playdate \n");
			sql.append("          FROM plan p, team t1 \n");
			sql.append("          WHERE p.tno1 = t1.tno  \n");
			sql.append("          AND TO_CHAR(playdate, 'yyyymmdd') = ?) A, team t2 \n");
			sql.append("    where A.tno2 = t2.tno) B, stadium s \n");
			sql.append("WHERE B.sno = s.sno");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScheduleDto scheduleDto = new ScheduleDto();
				scheduleDto.setHometeam(rs.getString("hometeam"));
				scheduleDto.setAwayteam(rs.getString("awayteam"));
				scheduleDto.setScore1(rs.getInt("score1"));
				scheduleDto.setScore2(rs.getInt("score2"));
				scheduleDto.setPlaydate(rs.getString("playdate"));
				scheduleDto.setSname(rs.getString("sname"));
				list.add(scheduleDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		System.out.println("ScheduleDaoImpl day-size >>> " + list.size());
		return list;
	}

	@Override
	public List<ScheduleDto> daySchedule(String date) {
		List<ScheduleDto> list = new ArrayList<ScheduleDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append(
					"from(select to_char(ppp.playdate,'yyyymmdd') playdate, ppp.tname hometeam, ppp.emblem homeemblem, t.tname awayteam, t.emblem awayemblem, ppp.score1, ppp.score2, ppp.sname, ppp.pstatus \n");
			sql.append("from team t, \n");
			sql.append(
					"(select pp.playdate, t.tname, t.emblem, pp.tno2, pp.score1, pp.score2, pp.sname, pp.pstatus \n");
			sql.append("from team t, \n");
			sql.append("(select p.playdate, p.tno1, p.tno2, p.score1, p.score2, s.sname, p.pstatus \n");
			sql.append("from plan p, stadium s \n");
			sql.append("where p.sno = s.sno) pp \n");
			sql.append("where pp.tno1 = t.tno) ppp \n");
			sql.append("where ppp.tno2 = t.tno)\n");
			sql.append("where playdate = ?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, date);
			System.out.println("ScheduleDaoImpl daily" + date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScheduleDto scheduleDto = new ScheduleDto();
				scheduleDto.setPlaydate(rs.getString("playdate"));
				scheduleDto.setHometeam(rs.getString("hometeam"));
				scheduleDto.setHomeemblem(rs.getString("homeemblem"));
				scheduleDto.setAwayteam(rs.getString("awayteam"));
				scheduleDto.setAwayemblem(rs.getString("awayemblem"));
				scheduleDto.setScore1(rs.getInt("score1"));
				scheduleDto.setScore2(rs.getInt("score2"));
				scheduleDto.setSname(rs.getString("sname"));
				scheduleDto.setPstatus(rs.getString("pstatus"));

				list.add(scheduleDto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		System.out.println("ScheduleDaoImpl" + list.size());
		return list;
	}
}
