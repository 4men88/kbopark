package com.baseball.gudan.model;

public class StadiumDto {
	
	private int sno; //�����ȣ
	private String sname; //�����̸�
	private String sloc; //�����ּ�
	private String image;	//�����̹���
	private double lat;	//����
	private double lng;	//�浵
	private int locid;	//��ġ���̵�
	

	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public int getLocid() {
		return locid;
	}
	public void setLocid(int locid) {
		this.locid = locid;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
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
