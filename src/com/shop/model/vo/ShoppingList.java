package com.shop.model.vo;

public class ShoppingList {
	private String memberId;
	private int musicNo;
	private int minimiItemNo;
	private int skinItemNo;
	private int dotori;
	
	public ShoppingList() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingList(String memberId, int musicNo, int minimiItemNo, int skinItemNo, int dotori) {
		super();
		this.memberId = memberId;
		this.musicNo = musicNo;
		this.minimiItemNo = minimiItemNo;
		this.skinItemNo = skinItemNo;
		this.dotori = dotori;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}

	public int getMinimiItemNo() {
		return minimiItemNo;
	}

	public void setMinimiItemNo(int minimiItemNo) {
		this.minimiItemNo = minimiItemNo;
	}

	public int getSkinItemNo() {
		return skinItemNo;
	}

	public void setSkinItemNo(int skinItemNo) {
		this.skinItemNo = skinItemNo;
	}

	public int getDotori() {
		return dotori;
	}

	public void setDotori(int dotori) {
		this.dotori = dotori;
	}

	@Override
	public String toString() {
		return "ShoppingList [memberId=" + memberId + ", musicNo=" + musicNo + ", minimiItemNo=" + minimiItemNo
				+ ", skinItemNo=" + skinItemNo + ", dotori=" + dotori + "]";
	}


}
