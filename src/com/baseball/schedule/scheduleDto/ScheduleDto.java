package com.baseball.schedule.scheduleDto;

import java.sql.Date;

import com.baseball.gudan.model.GudanDto;

public class ScheduleDto {
	
	private Date playdate;//�������
	private int score1;//Ȩ ����
	private int score2;// ����� ����
	private String pstatus; //������
	private String sname; // �����̸�
	private String tname;//�����̸�
	private String emblem; //�ں�
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getEmblem() {
		return emblem;
	}
	public void setEmblem(String emblem) {
		this.emblem = emblem;
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
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public void setPlaydate(Date date) {
		
	}
	public Date getPlaydate() {
		return playdate;
	}

}
