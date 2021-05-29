package com.shop.model.vo;

import java.util.List;

public class Minimi {

	private int itemNo;
	private String filepath;
	private int price;
	
	public Minimi() {}

	public Minimi(int itemNo, String filepath, int price) {
		super();
		this.itemNo = itemNo;
		this.filepath = filepath;
		this.price = price;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Minimi [itemNo=" + itemNo + ", filepath=" + filepath + ", price=" + price + "]";
	}

}
