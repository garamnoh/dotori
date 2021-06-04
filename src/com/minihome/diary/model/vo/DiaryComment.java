package com.minihome.diary.model.vo;

import java.sql.Date;

public class DiaryComment {

	private int commentNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContent;
	private int diaryRef;
	private int diaryCommentRef;
	private Date commentDate;
	private String writerName;
	
	public DiaryComment() {}

	public DiaryComment(int commentNo, int commentLevel, String commentWriter, String commentContent, int diaryRef,
			int diaryCommentRef, Date commentDate, String writerName) {
		super();
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.diaryRef = diaryRef;
		this.diaryCommentRef = diaryCommentRef;
		this.commentDate = commentDate;
		this.writerName=writerName;
	}

	public int getCommentNo() {return commentNo;}
	public void setCommentNo(int commentNo) {this.commentNo = commentNo;}
	public int getCommentLevel() {return commentLevel;}
	public void setCommentLevel(int commentLevel) {this.commentLevel = commentLevel;}
	public String getCommentWriter() {return commentWriter;}
	public void setCommentWriter(String commentWriter) {this.commentWriter = commentWriter;}
	public String getCommentContent() {return commentContent;}
	public void setCommentContent(String commentContent) {this.commentContent = commentContent;}
	public int getDiaryRef() {return diaryRef;}
	public void setDiaryRef(int diaryRef) {this.diaryRef = diaryRef;}
	public int getDiaryCommentRef() {return diaryCommentRef;}
	public void setDiaryCommentRef(int diaryCommentRef) {this.diaryCommentRef = diaryCommentRef;}
	public Date getCommentDate() {return commentDate;}
	public void setCommentDate(Date commentDate) {this.commentDate = commentDate;}
	public String getWriterName() {return writerName;}
	public void setWriterName(String writerName) {this.writerName = writerName;}

	@Override
	public String toString() {
		return "DiaryComment [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", commentWriter="
				+ commentWriter + ", commentContent=" + commentContent + ", diaryRef=" + diaryRef + ", diaryCommentRef="
				+ diaryCommentRef + ", commentDate=" + commentDate + writerName +"]";
	}
	
	
}
