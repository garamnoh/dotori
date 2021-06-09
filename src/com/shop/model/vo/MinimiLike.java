package com.shop.model.vo;

public class MinimiLike {
	private int itemNo;
	private int aHeartCount;
	
	public MinimiLike() {
		// TODO Auto-generated constructor stub
	}

	public MinimiLike(int itemNo, int aHeartCount) {
		super();
		this.itemNo = itemNo;
		this.aHeartCount = aHeartCount;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getaHeartCount() {
		return aHeartCount;
	}

	public void setaHeartCount(int aHeartCount) {
		this.aHeartCount = aHeartCount;
	}

	@Override
	public String toString() {
		return "MinimiLike [itemNo=" + itemNo + ", aHeartCount=" + aHeartCount + "]";
	}

	

}
