package com.friend.model.vo;

public class Like {
	
	private int diaryNo;
	private int count;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(int diaryNo, int count) {
		super();
		this.diaryNo = diaryNo;
		this.count = count;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Like [diaryNo=" + diaryNo + ", count=" + count + "]";
	}
	
}
