package com.shop.model.vo;

import java.util.List;

public class Skin {
	private int itemNo;
	private String skinTitle;
	private int price;
	private String filepath;
	private String cssFilepath;
	
	public Skin() {}

	public Skin(int itemNo, String skinTitle, int price, String filepath, String cssFilepath) {
		super();
		this.itemNo = itemNo;
		this.skinTitle = skinTitle;
		this.price = price;
		this.filepath = filepath;
		this.cssFilepath = cssFilepath;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getSkinTitle() {
		return skinTitle;
	}

	public void setSkinTitle(String skinTitle) {
		this.skinTitle = skinTitle;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getCssFilepath() {
		return cssFilepath;
	}

	public void setCssFilepath(String cssFilepath) {
		this.cssFilepath = cssFilepath;
	}

	@Override
	public String toString() {
		return "Skin [itemNo=" + itemNo + ", skinTitle=" + skinTitle + ", price=" + price + ", filepath=" + filepath
				+ ", cssFilepath=" + cssFilepath + "]";
	}
	
}
