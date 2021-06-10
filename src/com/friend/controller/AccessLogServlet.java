package com.friend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.friend.model.service.FriendService;
import com.google.gson.Gson;
import com.member.model.vo.Member;

/**
 * Servlet implementation class AccessLogServlet
 */
@WebServlet("/friends/accessLog")
public class AccessLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String myId = (String)((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		String friendId = request.getParameter("friendId");
		
		int accessCount = new FriendService().accessCount(myId, friendId);
		
		JSONObject json = new JSONObject();
		json.put("accessCount", accessCount);
		
		response.setContentType("application/json;charset=utf-8;");
		new Gson().toJson(json, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
