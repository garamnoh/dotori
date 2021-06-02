package com.friend.model.vo;

import java.sql.Date;

public class SearchF {
	
	private String memberId;
	private String memberName;
	private String nickname;
	private Date birth;
	private String gender;
	private String address;
	private String phone;
	private String profilePath;
	private String friendship;

	public SearchF() {
		// TODO Auto-generated constructor stub
	}

	public SearchF(String memberId, String memberName, String nickname, Date birth, String gender, String address,
			String phone, String profilePath, String friendship) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.nickname = nickname;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.profilePath = profilePath;
		this.friendship = friendship;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getFriendship() {
		return friendship;
	}

	public void setFriendship(String friendship) {
		this.friendship = friendship;
	}

	@Override
	public String toString() {
		return "SearchF [memberId=" + memberId + ", memberName=" + memberName + ", nickname=" + nickname + ", birth="
				+ birth + ", gender=" + gender + ", address=" + address + ", phone=" + phone + ", profilePath="
				+ profilePath + ", friendship=" + friendship + "]";
	}
	
}
