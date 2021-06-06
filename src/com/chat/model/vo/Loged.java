package com.chat.model.vo;

public class Loged {
	
	private String memberId;
	private String memberName;
	private String ninkname;
	private String profilePath;
	
	public Loged() {
		// TODO Auto-generated constructor stub
	}

	public Loged(String memberId, String memberName, String ninkname, String profilePath) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.ninkname = ninkname;
		this.profilePath = profilePath;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNinkname() {
		return ninkname;
	}

	public void setNinkname(String ninkname) {
		this.ninkname = ninkname;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "Loged [memberId=" + memberId + ", memberName=" + memberName + ", ninkname=" + ninkname
				+ ", profilePath=" + profilePath + "]";
	}
	
}
