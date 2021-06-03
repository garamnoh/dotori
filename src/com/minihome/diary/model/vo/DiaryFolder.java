package com.minihome.diary.model.vo;

public class DiaryFolder {
	private int folderNo;
	private String memberId;
	private String folderName;
	private String shareLevel;
	private int diaryCount;
	
	public DiaryFolder() {}

	public DiaryFolder(int folderNo, String memberId, String folderName, String shareLevel, int diaryCount) {
		super();
		this.folderNo = folderNo;
		this.memberId = memberId;
		this.folderName = folderName;
		this.shareLevel = shareLevel;
		this.diaryCount = diaryCount;
	}
	
	public int getFolderNo() {return folderNo;}
	public void setFolderNo(int folderNo) {this.folderNo = folderNo;}
	public String getMemberId() {return memberId;}
	public void setMemberId(String memberId) {this.memberId = memberId;}
	public String getFolderName() {return folderName;}
	public void setFolderName(String folderName) {this.folderName = folderName;}
	public String getShareLevel() {return shareLevel;}
	public void setShareLevel(String shareLevel) {this.shareLevel = shareLevel;}
	public int getDiaryCount() {return diaryCount;}
	public void setDiaryCount(int diaryCount) {this.diaryCount = diaryCount;}

	@Override
	public String toString() {
		return "DiaryFolder [folderNo=" + folderNo + ", memberId=" + memberId + ", folderName=" + folderName
				+ ", shareLevel=" + shareLevel + diaryCount+"]";
	}
	
}
