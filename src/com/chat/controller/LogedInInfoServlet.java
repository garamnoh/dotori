package com.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.chat.model.service.ChatService;
import com.chat.model.vo.Loged;
import com.google.gson.Gson;
import com.member.model.vo.Member;

/**
 * Servlet implementation class LogedInInfoServlet
 */
@WebServlet("/chat/logedInInfo")
public class LogedInInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogedInInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
		ArrayList<Loged> logedList = new ChatService().logedList(memberId);
		
		JSONObject json = new JSONObject();
		json.put("logedList", logedList);
		
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
