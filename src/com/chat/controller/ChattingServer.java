package com.chat.controller;

import java.io.IOException;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.chat.model.vo.Message;

// 웹소켓 서버의 역할을 하는 클래스에 @ServerEndpoint(주소)
@ServerEndpoint(
		value = "/chatting",
		encoders = {MessageEncoder.class},
		decoders = {MessageDecoder.class}
)
public class ChattingServer {
	
//	private HashMap<String, Session> clients = new HashMap<String, Session>();
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		
		System.out.println("client 접속");
		System.out.println(session);
		System.out.println(config);
	}
	
	@OnMessage
	//public void message(Session session, String msg) {
	public void message(Session session, Message data) {
		
		// client에 대한 정보 유지를 위해서
		// session.getUserProperties().put()
		session.getUserProperties().put("data", data);
		
		// 접속한 모든 세션 정보 로드
		Set<Session> clients = session.getOpenSessions();
		
		for(Session s : clients) {

			Message clientData = (Message)s.getUserProperties().get("data");
			// 접속한 모든 session에 메세지 전송
			try{
				// 0번 : 보낸사람 / 1번 : 받는사람 / 2번 : message / 3번 : 날짜
				if(clientData != null 
						// 특정 client?
						&& (clientData.getSender().equals(data.getReceiver())
								// 자기 자신?
								|| clientData.getSender().equals(data.getSender()))) {
					
					s.getBasicRemote().sendObject(data);
					
				} else if(clientData != null && data.getReceiver().equals("")){
					
					s.getBasicRemote().sendObject(data);
				}
					
				
			} catch(IOException|EncodeException e) {
				e.printStackTrace();
			}
		}
	}
}
