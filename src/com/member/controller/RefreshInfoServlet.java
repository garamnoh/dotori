package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.friend.model.service.FriendService;
import com.google.gson.Gson;
import com.member.model.service.MemberService;
import com.member.model.vo.Member;
import com.minihome.model.vo.Minihome;

/**
 * Servlet implementation class RefreshInfoServlet
 */
@WebServlet("/refreshInfo")
public class RefreshInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefreshInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		Minihome info = new MemberService().refreshInfo(memberId);
		int requestedFromCount = new FriendService().requestedFromInfo(memberId);
		int newFeedCount = new FriendService().newFeedCount(memberId);
		
		JSONObject json = new JSONObject();
		
		json.put("newFeedCount", newFeedCount);
		json.put("requestedFromCount", requestedFromCount);
		json.put("today", info.getToday());
		json.put("total", info.getTotal());
		
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
