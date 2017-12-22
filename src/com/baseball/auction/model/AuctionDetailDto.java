package com.baseball.auction.model;

public class AuctionDetailDto extends AuctionDto{
	
	private int ano; //경매번호
	private String mid;	//입찰회원 아이디
	private int bidPrice;//입찰가
	private String bidDate; //입찰시각
	private int bno; // 입찰번호
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getBidDate() {
		return bidDate;
	}
	public void setBidDate(String bidDate) {
		this.bidDate = bidDate;
	}

}
