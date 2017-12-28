package com.baseball.schedule.scheduleDto;

public class ScheduleDto {
	
	private String playdate;//경기일자
	private String hometeam;
	private String homeemblem;
	private String awayteam;
	private String awayemblem;
	private int score1;//홈 득점
	private int score2;// 어웨이 득점
	private String sname; // 구장이름
	private String pstatus; //경기상태
	private String playtime; //경기시간 
	
	public String getPlaytime() {
		return playtime;
	}
	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}
	public String getPlaydate() {
		return playdate;
	}
	public void setPlaydate(String playdate) {
		this.playdate = playdate;
	}
	public String getHometeam() {
		return hometeam;
	}
	public void setHometeam(String hometeam) {
		this.hometeam = hometeam;
	}
	public String getHomeemblem() {
		return homeemblem;
	}
	public void setHomeemblem(String homeemblem) {
		this.homeemblem = homeemblem;
	}
	public String getAwayteam() {
		return awayteam;
	}
	public void setAwayteam(String awayteam) {
		this.awayteam = awayteam;
	}
	public String getAwayemblem() {
		return awayemblem;
	}
	public void setAwayemblem(String awayemblem) {
		this.awayemblem = awayemblem;
	}
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	
	
}
