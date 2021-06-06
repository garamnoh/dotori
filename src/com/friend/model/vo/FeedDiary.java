package com.friend.model.vo;

import java.sql.Date;

public class FeedDiary {

	private int diaryNo;
	private String memberId;
	private String writer;
	private int folderNo;
	private String content;
	private Date postDate;
	private String memberName;
	private String profilePath;
	private String friendshipName;
	
	public FeedDiary() {
		// TODO Auto-generated constructor stub
	}

	protected FeedDiary(int diaryNo, String memberId, String writer, int folderNo, String content, Date postDate,
			String memberName, String profilePath, String friendshipName) {
		super();
		this.diaryNo = diaryNo;
		this.memberId = memberId;
		this.writer = writer;
		this.folderNo = folderNo;
		this.content = content;
		this.postDate = postDate;
		this.memberName = memberName;
		this.profilePath = profilePath;
		this.friendshipName = friendshipName;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getFriendshipName() {
		return friendshipName;
	}

	public void setFriendshipName(String friendshipName) {
		this.friendshipName = friendshipName;
	}

	@Override
	public String toString() {
		return "FeedDiary [diaryNo=" + diaryNo + ", memberId=" + memberId + ", writer=" + writer + ", folderNo="
				+ folderNo + ", content=" + content + ", postDate=" + postDate + ", memberName=" + memberName
				+ ", profilePath=" + profilePath + ", friendshipName=" + friendshipName + "]";
	}
	
}
