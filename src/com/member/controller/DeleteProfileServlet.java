package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;

/**
 * Servlet implementation class DeleteProfileServlet
 */
@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		int result = new MemberService().deleteProfile(memberId);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.invalidate();
			
			request.getRequestDispatcher("/").forward(request, response);
			
			
		} else {
			
			request.setAttribute("msg", "탈퇴에 실패했습니다.");
			request.setAttribute("loc", "/views/main/section_home_editProfile.jsp");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
