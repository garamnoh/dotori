package com.minihome.diary.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friend.model.service.FriendService;
import com.friend.model.vo.Friend;
import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.DiaryFolderShare;

/**
 * Servlet implementation class DiaryPageServlet
 */
@WebServlet("/diary/page")
public class DiaryPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
response.setContentType("text/html;charset=utf-8");
		
		int folderNo=Integer.parseInt(request.getParameter("diaryFolderLevel"));
		String loginMemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");		
		String currentPage=request.getParameter("currentPage");		
		
		request.setAttribute("diaryFolderLevel", folderNo);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/page/minihomeRightPageToDiary.do").forward(request, response);	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
