package com.baseball.schedule.scheduleDto;

public class ScheduleDto {
	
	private String playdate;//�������
	private String hometeam;
	private String homeemblem;
	private String awayteam;
	private String awayemblem;
	private int score1;//Ȩ ����
	private int score2;// ����� ����
	private String sname; // �����̸�
	private String pstatus; //������
	private String playtime; //���ð� 
	
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
