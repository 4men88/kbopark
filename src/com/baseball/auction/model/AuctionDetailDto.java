package com.baseball.auction.model;

public class AuctionDetailDto extends AuctionDto{
	
	private int ano; //��Ź�ȣ
	private String mid;	//����ȸ�� ���̵�
	private int bidPrice;//������
	private String bidDate; //�����ð�
	private int bno; // ������ȣ
	
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
