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
 * Servlet implementation class CancelServlet
 */
@WebServlet("/friends/cancel")
public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		String cancel = request.getParameter("cancel");
		
		int result = new FriendService().cancel(memberId, cancel);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		response.setContentType("application/json;charset=utf-8");
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
