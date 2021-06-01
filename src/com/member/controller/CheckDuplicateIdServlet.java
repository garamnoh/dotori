package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;


/**
 * Servlet implementation class CheckDuplicateIdServlet
 */
@WebServlet("/checkDuplicateId")
public class CheckDuplicateIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckDuplicateIdServlet() {
        
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 userId값이 DB Member 테이블에 있는지 확인
		/*
		 * String localPart=request.getParameter("memberId"); String
		 * domain=request.getParameter("domain");//
		 */
		//String memberId=localPart+"@"+domain;
		String memberId=request.getParameter("memberId");
		System.out.println(memberId);
		
		Member m =new MemberService().selectMemberId(memberId);
		//m이 null 이면 중복값이 없다.
		//m이 null이 아니면 중복값 있다.
		
		//boolean result=m ==null?true:false;
		request.setAttribute("result", m==null?true:false);
		request.getRequestDispatcher("/views/login/checkDuplicateId.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
