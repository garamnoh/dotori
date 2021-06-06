package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chat.model.service.ChatService;
import com.member.model.service.MemberService;
import com.member.model.vo.Member;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	
	private MemberService service=new MemberService();
	private static final long serialVersionUID = 1L;

    public LoginServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//request.setCharacterEncoding("utf-8");
		String localPart=request.getParameter("localPart");
		String domain=request.getParameter("domain");
		String userId=localPart+"@"+domain;
		String password=request.getParameter("password");
		
		System.out.println(userId);
		System.out.println(password);
		
		Member m=service.login(userId,password);
		String profilePath = service.profilePath(userId);
		
		System.out.println(m);
		if(m!=null) {
			new ChatService().saveLogedInInfo(m, profilePath);
			session.setAttribute("profilePath", profilePath);
			session.setAttribute("loginMember",m);
			session.setAttribute("admin", m.getMemberId());
			request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);
		}else {
 			String msg="아이디, 비밀번호가 일치하지 않습니다!";
 			String loc="/";
 			request.setAttribute("msg", msg);
 			request.setAttribute("loc", loc);
 			
 			RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
 			rd.forward(request, response);
 		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
