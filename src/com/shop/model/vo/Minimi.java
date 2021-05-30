package com.shop.model.vo;

import java.util.List;

public class Minimi {

	private int itemNo;
	private String filepath;
	private int price;
	private String title;
	
	public Minimi() {}

	public Minimi(int itemNo, String filepath, int price, String title) {
		super();
		this.itemNo = itemNo;
		this.filepath = filepath;
		this.price = price;
		this.title = title;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Minimi [itemNo=" + itemNo + ", filepath=" + filepath + ", price=" + price + ", title=" + title + "]";
	}
	
	

}
