package com.baseball.board.model;

public class BoardDto {

	private int bno;// 글번호
	private String mid;// 작성자아이디
	private String mname;// 작성자이름
	private String bname;// 글제목
	private String bdetail;// 글내용
	private int tno; //구단번호
	private int bcount;// 조회수
	private String bdate;// 작성시각
	private int bstatus;// 신고상태
	private int totalreply; //총 리플 개수
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getTotalreply() {
		return totalreply;
	}
	public void setTotalreply(int totalreply) {
		this.totalreply = totalreply;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBdetail() {
		return bdetail;
	}
	public void setBdetail(String bdetail) {
		this.bdetail = bdetail;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBstatus() {
		return bstatus;
	}
	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}
}