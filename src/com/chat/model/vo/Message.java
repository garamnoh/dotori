package com.chat.model.vo;

import java.sql.Date;

public class Message {

	private String sender;
	private String receiver;
	private String msg;
	private String date;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	protected Message(String sender, String receiver, String msg, String date) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.msg = msg;
		this.date = date;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Message [sender=" + sender + ", receiver=" + receiver + ", msg=" + msg + ", date=" + date + "]";
	}

}
