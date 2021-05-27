package com.shop.model.vo;

public class SkinItem {
	private int itemNo;
	private String skinTitle;
	private String category;
	private int price;
	private String filePath;
	
	public SkinItem() {
		// TODO Auto-generated constructor stub
	}

	public SkinItem(int itemNo, String skinTitle, String category, int price, String filePath) {
		super();
		this.itemNo = itemNo;
		this.skinTitle = skinTitle;
		this.category = category;
		this.price = price;
		this.filePath = filePath;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	
	

}
