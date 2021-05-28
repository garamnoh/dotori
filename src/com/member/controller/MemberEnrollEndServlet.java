package com.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dotori.service.MemberService;
import com.dotori.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet(name="enrollMember",urlPatterns="/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		
	
		//String memberId =request.getParameter("memberId");
		
		String localPart=request.getParameter("memberId");
		String domain=request.getParameter("domain");//

		String memberId=localPart+"@"+domain;
		String memberPwd=request.getParameter("memberPwd");
		String memberName=request.getParameter("memberName");
		String nickname=request.getParameter("nickname");
		Date birthDate=Date.valueOf(request.getParameter("birthDate"));
		String gender= request.getParameter("gender");
		String phone =request.getParameter("phone");
		String address=request.getParameter("address");
		
		//int dotori =Integer.parseInt(request.getParameter("dotori"));
		Member m=new Member(memberId,memberPwd,memberName,
				nickname,birthDate,gender,phone,address,0, null);
		//첫번째 birthDate은 생년월일 두번쨰는 등록일
		System.out.println(memberId);
		System.out.println(memberPwd);
		System.out.println(memberName);
		System.out.println(nickname);
		System.out.println(birthDate);
		System.out.println(gender);
		System.out.println(phone);
		System.out.println(address);
		int result=new MemberService().insertMember(m);
		
		//클라이언트에게 보여준 페이지 선택 
		String msg="";
		String loc="";
		
		if(result>0) {
			//회원가입 성공
			msg="회원가입 성공!";
			loc="/";
		}else {
			//회원가입 실패
			msg="회원가입 실패";
			loc="/views/login/memberEnroll.jsp";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
