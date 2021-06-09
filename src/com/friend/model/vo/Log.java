package com.friend.model.vo;

public class Log {

	private String memberId;
	private int visitCount;
	
	public Log() {
		// TODO Auto-generated constructor stub
	}

	public Log(String memberId, int visitCount) {
		super();
		this.memberId = memberId;
		this.visitCount = visitCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	@Override
	public String toString() {
		return "MyLog [memberId=" + memberId + ", visitCount=" + visitCount + "]";
	}
}