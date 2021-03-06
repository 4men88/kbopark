package com.baseball.member.model;

public class MemberDetailDto extends MemberDto {

	private String tel1;
	private String tel2;
	private String tel3;
	private String zip1;
	private String zip2;
	private String addr1;
	private String addr2;
	private int tno;
	private int rookie;
	private int penalty;
	private String mstatus;
	private String favoriteteam;
	
	
	
	
	public String getFavoriteteam() {
		return favoriteteam;
	}

	public void setFavoriteteam(String favoriteteam) {
		this.favoriteteam = favoriteteam;
	}

	public String getZip2() {
		return zip2;
	}

	public void setZip2(String zip2) {
		this.zip2 = zip2;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public int getRookie() {
		return rookie;
	}

	public void setRookie(int rookie) {
		this.rookie = rookie;
	}

	public int getPenalty() {
		return penalty;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}

	public String getMstatus() {
		return mstatus;
	}

	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getZip1() {
		return zip1;
	}

	public void setZip1(String zip1) {
		this.zip1 = zip1;
	}


	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


}
