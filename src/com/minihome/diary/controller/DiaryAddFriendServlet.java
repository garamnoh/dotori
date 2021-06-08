package com.minihome.diary.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;

/**
 * Servlet implementation class DiaryAddFriendServlet
 */
@WebServlet("/diary/addFriend")
public class DiaryAddFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryAddFriendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int shareFolderNo=Integer.parseInt(request.getParameter("shareFolderNo"));
		String shareMember=request.getParameter("shareMember");
		String MemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");
		String members[]=shareMember.split(",");
		int result=0;
			
		for(int i=0; i<members.length; i++) {			
			result=new DiaryService().insertShareDiaryFolder(shareFolderNo, members[i]);
		}			
		
		if(result>0) {
			request.getRequestDispatcher("/page/minihomeLeftPageToDiary.do").forward(request,response);		
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
