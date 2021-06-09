package com.minihome.album.model.vo;

public class PhotoLike {
	
	private int imgNo;
	private String memberId;
	
	public PhotoLike() {}

	public PhotoLike(int imgNo, String memberId) {
		super();
		this.imgNo = imgNo;
		this.memberId = memberId;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "PhotoLike [imgNo=" + imgNo + ", memberId=" + memberId + "]";
	}

}
