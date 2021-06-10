package com.shop.model.vo;

public class MusicLike {
	private int musicNo;
	private int cHeartCount;
	
	public MusicLike() {
		// TODO Auto-generated constructor stub
	}

	

	MusicLike(int musicNo, int cHeartCount) {
		super();
		this.musicNo = musicNo;
		this.cHeartCount = cHeartCount;
	}



	public int getMusicNo() {
		return musicNo;
	}



	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}



	public int getcHeartCount() {
		return cHeartCount;
	}



	public void setcHeartCount(int cHeartCount) {
		this.cHeartCount = cHeartCount;
	}



	@Override
	public String toString() {
		return "MusicLike [musicNo=" + musicNo + ", cHeartCount=" + cHeartCount + "]";
	}



	
	
	
	

	
	
	
	
	
	
	
}
