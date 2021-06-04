package com.shop.model.vo;

import java.util.List;

public class Skin {
	private int itemNo;
	private String skinTitle;
	private int price;
	private String previewImgFilepath;
	private String cssFilepath;
	
	public Skin() {}

	public Skin(int itemNo, String skinTitle, int price, String previewImgFilepath, String cssFilepath) {
		super();
		this.itemNo = itemNo;
		this.skinTitle = skinTitle;
		this.price = price;
		this.previewImgFilepath = previewImgFilepath;
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

	public String getPreviewImgFilepath() {
		return previewImgFilepath;
	}

	public void setPreviewImgFilepath(String previewImgFilepath) {
		this.previewImgFilepath = previewImgFilepath;
	}

	public String getCssFilepath() {
		return cssFilepath;
	}

	public void setCssFilepath(String cssFilepath) {
		this.cssFilepath = cssFilepath;
	}

	@Override
	public String toString() {
		return "Skin [itemNo=" + itemNo + ", skinTitle=" + skinTitle + ", price=" + price + ", previewImgFilepath="
				+ previewImgFilepath + ", cssFilepath=" + cssFilepath + "]";
	}

}
