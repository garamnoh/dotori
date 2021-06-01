package com.shop.model.vo;

import java.util.List;

public class Music {
	
	private int musicNo;
	private String musicTitle;
	private String singer;
	private String filepath;
	private int price;
	private String imgFilepath;
	
	public Music() {}

	public Music(int musicNo, String musicTitle, String singer, String filepath, int price, String imgFilepath) {
		super();
		this.musicNo = musicNo;
		this.musicTitle = musicTitle;
		this.singer = singer;
		this.filepath = filepath;
		this.price = price;
		this.imgFilepath = imgFilepath;
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

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImgFilepath() {
		return imgFilepath;
	}

	public void setImgFilepath(String imgFilepath) {
		this.imgFilepath = imgFilepath;
	}

	@Override
	public String toString() {
		return "Music [musicNo=" + musicNo + ", musicTitle=" + musicTitle + ", singer=" + singer + ", filepath="
				+ filepath + ", price=" + price + ", imgFilepath=" + imgFilepath + "]";
	}

}
