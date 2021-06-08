package com.friend.model.vo;

public class Like {
	
	private int No;
	private int count;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(int no, int count) {
		super();
		No = no;
		this.count = count;
	}

	public int getNo() {
		return No;
	}

	public void setNo(int no) {
		No = no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Like [No=" + No + ", count=" + count + "]";
	}
	
}
