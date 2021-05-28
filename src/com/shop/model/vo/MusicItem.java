package com.shop.model.vo;

public class MusicItem {
	
	private int musicNo;
	private String musicTitle;
	private String singer;
	private String filePath;
	private int price;
	
	public MusicItem() {
		// TODO Auto-generated constructor stub
	}

	public MusicItem(int musicNo, String musicTitle, String singer, String filePath, int price) {
		super();
		this.musicNo = musicNo;
		this.musicTitle = musicTitle;
		this.singer = singer;
		this.filePath = filePath;
		this.price = price;
	}

	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}

	public String getMusicTitle() {
		return musicTitle;
	}

	public void setMusicTitle(String musicTitle) {
		this.musicTitle = musicTitle;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	

}
