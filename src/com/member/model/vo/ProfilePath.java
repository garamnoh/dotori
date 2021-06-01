package com.member.model.vo;

public class ProfilePath {
	
	private String memberId;
	private String minimiProfilePath;
	
	public ProfilePath() {
		// TODO Auto-generated constructor stub
	}

	public ProfilePath(String memberId, String minimiProfilePath) {
		super();
		this.memberId = memberId;
		this.minimiProfilePath = minimiProfilePath;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMinimiProfilePath() {
		return minimiProfilePath;
	}

	public void setMinimiProfilePath(String minimiProfilePath) {
		this.minimiProfilePath = minimiProfilePath;
	}

	@Override
	public String toString() {
		return "ProfilePath [memberId=" + memberId + ", minimiProfilePath=" + minimiProfilePath + "]";
	}

}
