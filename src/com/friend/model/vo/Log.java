package com.friend.model.vo;

import java.sql.Date;

public class Log {

	private String memberId;
	private int visitCount;
	private String memberName;
	private String gender;
	private Date birth;
	private String profilePath;
	
	public Log() {
		// TODO Auto-generated constructor stub
	}

	public Log(String memberId, int visitCount, String memberName, String gender, Date birth, String profilePath) {
		super();
		this.memberId = memberId;
		this.visitCount = visitCount;
		this.memberName = memberName;
		this.gender = gender;
		this.birth = birth;
		this.profilePath = profilePath;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "Log [memberId=" + memberId + ", visitCount=" + visitCount + ", memberName=" + memberName + ", gender="
				+ gender + ", birth=" + birth + ", profilePath=" + profilePath + "]";
	}
	
}