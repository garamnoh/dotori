package com.minihome.diary.model.vo;

public class DiaryFolderShare {

	private int diaryNo;
	private String allowedMember;
	private String shareLevel;
	
	public DiaryFolderShare() {}
	
	public DiaryFolderShare(int diaryNo, String allowedMember, String shareLevel) {
		super();
		this.diaryNo = diaryNo;
		this.allowedMember = allowedMember;
		this.shareLevel = shareLevel;
	}
	
	public int getDiaryNo() {return diaryNo;}
	public void setDiaryNo(int diaryNo) {this.diaryNo = diaryNo;}
	public String getAllowedMember() {return allowedMember;}
	public void setAllowedMember(String allowedMember) {this.allowedMember = allowedMember;}
	public String getShareLevel() {return shareLevel;}
	public void setShareLevel(String shareLevel) {this.shareLevel = shareLevel;}

	@Override
	public String toString() {
		return "DiaryFolderShare [diaryNo=" + diaryNo + ", allowedMember=" + allowedMember + ", shareLevel="
				+ shareLevel + "]";
	}
	
}
