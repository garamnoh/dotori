package com.diary.model.vo;

import java.sql.Date;

public class Diary {
	private int diaryNo;
	private String memberId;
	private String writer;
	private String title;
	private int folderNo;
	private String content;
	private Date postDate;
	
	public Diary() {}

	public Diary(int diaryNo, String memberId, String writer, String title, int folderNo, String content,
			Date postDate) {
		super();
		this.diaryNo = diaryNo;
		this.memberId = memberId;
		this.writer = writer;
		this.title = title;
		this.folderNo = folderNo;
		this.content = content;
		this.postDate = postDate;
	}

	public int getDiaryNo() {return diaryNo;}
	public void setDiaryNo(int diaryNo) {this.diaryNo = diaryNo;}
	public String getMemberId() {return memberId;}
	public void setMemberId(String memberId) {this.memberId = memberId;}
	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public int getFolderNo() {return folderNo;}
	public void setFolderNo(int folderNo) {this.folderNo = folderNo;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public Date getPostDate() {return postDate;}
	public void setPostDate(Date postDate) {this.postDate = postDate;}

	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", memberId=" + memberId + ", writer=" + writer + ", title=" + title
				+ ", folderNo=" + folderNo + ", content=" + content + ", postDate=" + postDate + "]";
	}	
}
