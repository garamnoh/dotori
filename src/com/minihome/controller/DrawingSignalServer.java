package com.minihome.controller;

import java.io.IOException;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(
		value="/webSocket/drawingSignal"
)
public class DrawingSignalServer {

	@OnOpen
	public void open(Session session,EndpointConfig config) {}
	
	@OnMessage
	public void message(Session session,String msg) {
		
		session.getUserProperties().put("msg",msg);
		
		Set<Session> clients=session.getOpenSessions();
		
		System.out.println("서버 메시지 테스트 : "+msg);
		
		for(Session s:clients) {
			String clientData=(String)s.getUserProperties().get("msg");
			try {
				if(clientData!=null&&msg.split("<<<")[0].equals(clientData.split("<<<")[0])) {
					
					
					System.out.println("테스트테스트");
					String colorStr=msg.split("<<<")[1];
					s.getBasicRemote().sendText(colorStr);
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
