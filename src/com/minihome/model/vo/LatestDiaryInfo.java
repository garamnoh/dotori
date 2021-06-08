package com.minihome.model.vo;

import java.sql.Date;

public class LatestDiaryInfo {

	private String writer;
	private String nickname;
	private String folderName;
	private Date postDate;
	
	public LatestDiaryInfo() {}

	public LatestDiaryInfo(String writer, String nickname, String folderName, Date postDate) {
		super();
		this.writer = writer;
		this.nickname = nickname;
		this.folderName = folderName;
		this.postDate = postDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	@Override
	public String toString() {
		return "LatestDiaryInfo [writer=" + writer + ", nickname=" + nickname + ", folderName=" + folderName
				+ ", postDate=" + postDate + "]";
	}

}
