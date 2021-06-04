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
 * Servlet implementation class IdSearchServlet
 */
@WebServlet("/IdSearch")
public class IdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		String memberName=request.getParameter("memberName");
		String phone =request.getParameter("phone");
		Member m =new MemberService().idSearch(memberName, phone);
		
		JSONObject json = new JSONObject();
		if(m!=null) {
		json.put("memberId","계정명 : "+ m.getMemberId());
		}else {
		json.put("memberId", "일치하는 데이터가 없습니다. 다시 입력해주세요.");
		}
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(json,response.getWriter());
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
