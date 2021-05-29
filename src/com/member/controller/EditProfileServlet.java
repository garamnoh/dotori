package com.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.member.model.vo.Member;
import com.member.model.service.MemberService;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member = new Member();
		
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberName(request.getParameter("memberName"));
		member.setNickname(request.getParameter("nickname"));
		member.setBirthDate(Date.valueOf(request.getParameter("birth")));
		member.setGender(request.getParameter("gender"));
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
		//		try {
//			member.setPhone(AESEncrypt.encrypt(request.getParameter("phone")));
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		
		int result = new MemberService().editProfile(member);
		member = new MemberService().selectMemberId(request.getParameter("memberId"));
		
		JSONObject json = new JSONObject();
		
		json.put("result", result);
		json.put("memberId", member.getMemberId());
		json.put("memberName", member.getMemberName());
		json.put("nickname", member.getNickname());
		json.put("birth", member.getBirthDate());
		json.put("gender", member.getGender());
		json.put("phone", member.getPhone());
		json.put("address", member.getAddress());

		response.setContentType("application/json;charset=utf-8;");
//		response.getWriter().print(json);
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
