package com.minihome.diary.model.vo;

import java.sql.Date;

public class Diary {
	private int diaryNo;
	private String memberId;
	private String writer;
	private int folderNo;
	private String content;
	private Date postDate;
	private String memberName;
	
	public Diary() {}

	public Diary(int diaryNo, String memberId, String writer, int folderNo, String content,
			Date postDate, String memberName) {
		super();
		this.diaryNo = diaryNo;
		this.memberId = memberId;
		this.writer = writer;
		this.folderNo = folderNo;
		this.content = content;
		this.postDate = postDate;
		this.memberName=memberName;
	}

	public int getDiaryNo() {return diaryNo;}
	public void setDiaryNo(int diaryNo) {this.diaryNo = diaryNo;}
	public String getMemberId() {return memberId;}
	public void setMemberId(String memberId) {this.memberId = memberId;}
	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}
	public int getFolderNo() {return folderNo;}
	public void setFolderNo(int folderNo) {this.folderNo = folderNo;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public Date getPostDate() {return postDate;}
	public void setPostDate(Date postDate) {this.postDate = postDate;}
	public String getMemberName() {return memberName;}
	public void setMemberName(String memberName) {this.memberName = memberName;}	
	
	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", memberId=" + memberId + ", writer=" + writer
				+ ", folderNo=" + folderNo + ", content=" + content + ", postDate=" + postDate + "]";
	}	
}
