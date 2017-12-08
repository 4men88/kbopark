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

	private ScheduleDaoImpl() {

	}

	public static ScheduleDao getScheduleDao() {
		return scheduleDao;
	}

	@Override
	public List<ScheduleDto> getSchedule() {

		List<ScheduleDto> list = new ArrayList<ScheduleDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select to_char(ppp.playdate,'yyyymmdd') playdate, ppp.tname hometeam, ppp.emblem homeemblem, t.tname awayteam, t.emblem awayemblem, ppp.score1, ppp.score2, ppp.sname, ppp.pstatus \n");
			sql.append("from team t, \n");
			sql.append("(select pp.playdate, t.tname, t.emblem, pp.tno2, pp.score1, pp.score2, pp.sname, pp.pstatus \n");
			sql.append("from team t, \n");
			sql.append("(select p.playdate, p.tno1, p.tno2, p.score1, p.score2, s.sname, p.pstatus \n");
			sql.append("from plan p, stadium s \n");
			sql.append("where p.sno = s.sno) pp \n");
			sql.append("where pp.tno1 = t.tno) ppp \n");
			sql.append("where ppp.tno2 = t.tno");

			pstmt = conn.prepareStatement(sql.toString());
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		System.out.println("ScheduleDaoImpl" + list.size());
		System.out.println("ScheduleDaoImpl" + list);

		return list;
	}

}
