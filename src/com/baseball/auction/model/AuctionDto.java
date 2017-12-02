package com.baseball.auction.model;


import java.sql.Clob;


public class AuctionDto {
	private int ano; //경매번호
	private String aname; //물품명
	private Clob adetail;	//물품상세
	private String startTime; //등록시간
	private String endTime; //종료시간
	private String sid; //판매회원 아이디
	private int initPrice; //입찰시작가
	private String category1; //대분류
	private String category2; //중분류
	private int astatus; //경매상태
	private int acount;	//조회수
	private int tno; //구단분류번호
	private String aimage; //이미지
	private int bidNum; // 입찰자수
	
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getBidNum() {
		return bidNum;
	}
	public void setBidNum(int bidNum) {
		this.bidNum = bidNum;
	}
	public String getAimage() {
		return aimage;
	}
	public void setAimage(String aimage) {
		this.aimage = aimage;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Clob getAdetail() {
		return adetail;
	}
	public void setAdetail(Clob adetail) {
		this.adetail = adetail;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getMid() {
		return sid;
	}
	public void setMid(String sid) {
		this.sid = sid;
	}
	public int getInitPrice() {
		return initPrice;
	}
	public void setInitPrice(int initPrice) {
		this.initPrice = initPrice;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public int getAstatus() {
		return astatus;
	}
	public void setAstatus(int astatus) {
		this.astatus = astatus;
	}
	public int getAcount() {
		return acount;
	}
	public void setAcount(int acount) {
		this.acount = acount;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}

}
