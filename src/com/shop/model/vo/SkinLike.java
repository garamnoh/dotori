package com.shop.model.vo;

public class SkinLike {
	private int itemNo;
	private int bHeartCount;
	
	public SkinLike() {
		// TODO Auto-generated constructor stub
	}

	SkinLike(int itemNo, int bHeartCount) {
		super();
		this.itemNo = itemNo;
		this.bHeartCount = bHeartCount;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getbHeartCount() {
		return bHeartCount;
	}

	public void setbHeartCount(int bHeartCount) {
		this.bHeartCount = bHeartCount;
	}

	@Override
	public String toString() {
		return "SkinLike [itemNo=" + itemNo + ", bHeartCount=" + bHeartCount + "]";
	}
	
	
	

	


	
	

}
