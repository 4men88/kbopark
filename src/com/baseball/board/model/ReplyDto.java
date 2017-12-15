package com.baseball.board.model;

public class ReplyDto {

	private int reno; //댓글번호
	private int bno; //원글번호
	private String mid; //작성회원아이디
	private String replyname; //작성회원이름..?이거컬럼명바꾼거같은데 확인할것
	private String recontent; //댓글내용
	private String retime; //댓글작성일
	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
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
	public String getReplyname() {
		return replyname;
	}
	public void setReplyname(String replyname) {
		this.replyname = replyname;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getRetime() {
		return retime;
	}
	public void setRetime(String retime) {
		this.retime = retime;
	}
<<<<<<< HEAD
=======
	
>>>>>>> dea173dce3d466e73643cd3e951b710f15ecf46f
	
}