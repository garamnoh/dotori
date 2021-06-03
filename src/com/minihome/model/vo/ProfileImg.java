package com.minihome.model.vo;

public class ProfileImg {

	private String memberId;
	private String filepath;
	
	public ProfileImg() {}

	public ProfileImg(String memberId, String filepath) {
		super();
		this.memberId = memberId;
		this.filepath = filepath;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	@Override
	public String toString() {
		return "ProfileImg [memberId=" + memberId + ", filepath=" + filepath + "]";
	}
	
}
