package com.minihome.model.vo;

public class Minihome {

	private String memberId;
	private int today;
	private int total;
	private int skin_item_no;
	
	public Minihome() {}

	public Minihome(String memberId, int today, int total, int skin_item_no) {
		super();
		this.memberId = memberId;
		this.today = today;
		this.total = total;
		this.skin_item_no = skin_item_no;
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

	public int getSkin_item_no() {
		return skin_item_no;
	}

	public void setSkin_item_no(int skin_item_no) {
		this.skin_item_no = skin_item_no;
	}

	@Override
	public String toString() {
		return "Minihome [memberId=" + memberId + ", today=" + today + ", total=" + total + ", skin_item_no="
				+ skin_item_no + "]";
	}
	
}
