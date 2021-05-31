package com.minihome.diary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.Diary;

/**
 * Servlet implementation class DiaryFolder
 */
@WebServlet(name = "DiaryFolderServlet", urlPatterns = { "/diary/diaryFolder" })
public class DiaryFolderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryFolderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String folderName=request.getParameter("diary_a");
		int folderLevel=0;
		switch(folderName) {
			case "전체공개" : folderLevel=1;
			case "일촌공개" : folderLevel=2;
			case "비공개" : folderLevel=3;
		}
		request.setAttribute("folderLevel", folderLevel);
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
