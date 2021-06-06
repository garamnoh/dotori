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
		System.out.println(session.getId());
	}
	
	@OnMessage
	//public void message(Session session, String msg) {
	public void message(Session session, Message curMsg) {
//		System.out.println(msg);
		
		// client에 대한 정보 유지를 위해서
		// session.getUserProperties().put()
		// session.getUserProperties().put("msg", msg);	
		// String[] msgData = msg.split(",");
		
//		Message curMsg = new Gson().fromJson(msg, Message.class);
		
		
		System.out.println("curMsg : " + curMsg);
		
		session.getUserProperties().put("msg", curMsg);
		//session.getUserProperties().put("msg", msg.split(",")); // sender msg
		
		
//		clients.put(msg, session);
		// 접속한 모든 세션에게 msg 전송
		// 접속한 모든 세션관리는 List, Set, Map
		// 접속한 모든 세션 가져오는 method : getOpenSessions() -> Set<Session>
		Set<Session> clients = session.getOpenSessions();
		for(Session s : clients) {
			Message clientData = (Message)s.getUserProperties().get("msg");
			// 접속한 모든 session에 메세지 전송
			try{
				// 0번 : 보낸사람 / 1번 : 받는사람 / 2번 : message
				if(clientData != null 
						&& (clientData.getSender().equals(curMsg.getReceiver())
							|| clientData.getSender().equals(curMsg.getSender()))) {
					
					// 보낸 사람이 받는 사람과 같으면
					// 접속한 session 중 보낸 사람의 데이터가 현재 보낸진 메세지 받는 ㅅ람과 같은 session을 필터링
//					s.getBasicRemote().sendText(msg);
					s.getBasicRemote().sendObject(curMsg);
					
				} else if(clientData != null && curMsg.getReceiver().equals("")){
					
//					s.getBasicRemote().sendText(msg);
					s.getBasicRemote().sendObject(curMsg);
				}
					
				
			} catch(IOException|EncodeException e) {
				e.printStackTrace();
			}
		}
	}
}
