package com.friend.model.vo;

import java.sql.Date;

public class FeedAlbum {

	private int imgNo;
	private String memberId;
	private String title;
	private String filepath;
	private String folder;
	private Date postDate;
	private String hashTag;
	private String content;
	private String profilePath;
	private String memberName;
	private String friendshipName;
	
	public FeedAlbum() {
		// TODO Auto-generated constructor stub
	}

	protected FeedAlbum(int imgNo, String memberId, String title, String filepath, String folder, Date postDate,
			String hashTag, String content, String profilePath, String memberName, String friendshipName) {
		super();
		this.imgNo = imgNo;
		this.memberId = memberId;
		this.title = title;
		this.filepath = filepath;
		this.folder = folder;
		this.postDate = postDate;
		this.hashTag = hashTag;
		this.content = content;
		this.profilePath = profilePath;
		this.memberName = memberName;
		this.friendshipName = friendshipName;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getFriendshipName() {
		return friendshipName;
	}

	public void setFriendshipName(String friendshipName) {
		this.friendshipName = friendshipName;
	}

	@Override
	public String toString() {
		return "FeedAlbum [imgNo=" + imgNo + ", memberId=" + memberId + ", title=" + title + ", filepath=" + filepath
				+ ", folder=" + folder + ", postDate=" + postDate + ", hashTag=" + hashTag + ", content=" + content
				+ ", profilePath=" + profilePath + ", memberName=" + memberName + ", friendshipName=" + friendshipName
				+ "]";
	}
	
}
