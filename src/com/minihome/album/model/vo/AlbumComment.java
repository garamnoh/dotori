package com.minihome.album.model.vo;

import java.sql.Date;

public class AlbumComment {

	private int commentNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContent;
	private int albumRef;
	private int albumCommentRef;
	private Date commentDate;
	
	public AlbumComment() {}

	public AlbumComment(int commentNo, int commentLevel, String commentWriter, String commentContent, int albumRef,
			int albumCommentRef, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.albumRef = albumRef;
		this.albumCommentRef = albumCommentRef;
		this.commentDate = commentDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getAlbumRef() {
		return albumRef;
	}

	public void setAlbumRef(int albumRef) {
		this.albumRef = albumRef;
	}

	public int getAlbumCommentRef() {
		return albumCommentRef;
	}

	public void setAlbumCommentRef(int albumCommentRef) {
		this.albumCommentRef = albumCommentRef;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "AlbumComment [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", commentWriter="
				+ commentWriter + ", commentContent=" + commentContent + ", albumRef=" + albumRef + ", albumCommentRef="
				+ albumCommentRef + ", commentDate=" + commentDate + "]";
	}
	
}
