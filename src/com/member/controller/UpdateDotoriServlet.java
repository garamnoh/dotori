package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class UpdateMinimiServlet
 */
@WebServlet("/updateDotori")
public class UpdateDotoriServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDotoriServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		int dotori= Integer.parseInt(request.getParameter("dotori"));
		
		int result = new MemberService().updateDotori(memberId, dotori);
		
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
