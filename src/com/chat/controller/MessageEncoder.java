package com.chat.controller;

import javax.websocket.EncodeException;
import javax.websocket.Encoder.Text;
import javax.websocket.EndpointConfig;

import com.chat.model.vo.Message;
import com.google.gson.Gson;

public class MessageEncoder implements Text<Message> {

	// alt + s + v
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String encode(Message arg0) throws EncodeException {
		// TODO Auto-generated method stub
		return new Gson().toJson(arg0);
	}

	
}
