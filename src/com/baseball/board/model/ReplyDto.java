package com.baseball.board.model;

public class ReplyDto {

	private int reno; //��۹�ȣ
	private int bno; //���۹�ȣ
	private String mid; //�ۼ�ȸ�����̵�
	private String rename; //�ۼ�ȸ���̸�..?�̰��÷���ٲ۰Ű����� Ȯ���Ұ�
	private String recontent; //��۳���
	private String retime; //����ۼ���
	
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
	public String getRename() {
		return rename;
	}
	public void setRename(String rename) {
		this.rename = rename;
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
}
