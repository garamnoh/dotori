package com.minihome.diary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;

/**
 * Servlet implementation class DiaryFolderWrite
 */
@WebServlet("/diary/folderWrite")
public class DiaryFolderWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryFolderWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String addFolderName=request.getParameter("addFolderName");
		String loginMemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");
		
		if(loginMemberId.equals(hostMemberId)) {
			int result=new DiaryService().insertDiaryFolder(addFolderName, hostMemberId);			
			if(result>0) {
				request.getRequestDispatcher("/views/minihome/leftpage_diary.jsp").forward(request,response);
			}
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
