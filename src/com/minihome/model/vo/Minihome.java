package com.minihome.model.vo;

import java.sql.Date;

public class Minihome {

	private String memberId;
	private int today;
	private int total;
	private int skinItemNo;
	private Date todayDate;
	private int profileImgNo;
	private String profileContent;
	private String feeling;
	
	public Minihome() {}

	public Minihome(String memberId, int today, int total, int skinItemNo, Date todayDate, int profileImgNo,
			String profileContent, String feeling) {
		super();
		this.memberId = memberId;
		this.today = today;
		this.total = total;
		this.skinItemNo = skinItemNo;
		this.todayDate = todayDate;
		this.profileImgNo = profileImgNo;
		this.profileContent = profileContent;
		this.feeling = feeling;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getToday() {
		return today;
	}

	public void setToday(int today) {
		this.today = today;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getSkinItemNo() {
		return skinItemNo;
	}

	public void setSkinItemNo(int skinItemNo) {
		this.skinItemNo = skinItemNo;
	}

	public Date getTodayDate() {
		return todayDate;
	}

	public void setTodayDate(Date todayDate) {
		this.todayDate = todayDate;
	}

	public int getProfileImgNo() {
		return profileImgNo;
	}

	public void setProfileImgNo(int profileImgNo) {
		this.profileImgNo = profileImgNo;
	}

	public String getProfileContent() {
		return profileContent;
	}

	public void setProfileContent(String profileContent) {
		this.profileContent = profileContent;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

	@Override
	public String toString() {
		return "Minihome [memberId=" + memberId + ", today=" + today + ", total=" + total + ", skinItemNo=" + skinItemNo
				+ ", todayDate=" + todayDate + ", profileImgNo=" + profileImgNo + ", profileContent=" + profileContent
				+ ", feeling=" + feeling + "]";
	}

}
