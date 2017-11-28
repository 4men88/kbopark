package com.baseball.gudan.model;

public class GudanDto {
	
	private int tno; // 구단번호
	private String tname;//구단이름
	private String emblem;//엠블럼
	private int sno1;//홈구장
	private int sno2;//제2구장
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
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
	public int getSno1() {
		return sno1;
	}
	public void setSno1(int sno1) {
		this.sno1 = sno1;
	}
	public int getSno2() {
		return sno2;
	}
	public void setSno2(int sno2) {
		this.sno2 = sno2;
	}

}
