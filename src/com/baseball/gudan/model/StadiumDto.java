package com.baseball.gudan.model;

public class StadiumDto {
	
	private int sno; //구장번호
	private String sname; //구장이름
	private String sloc; //구장주소
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSloc() {
		return sloc;
	}
	public void setSloc(String sloc) {
		this.sloc = sloc;
	}

}
