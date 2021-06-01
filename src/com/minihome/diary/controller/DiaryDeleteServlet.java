package com.minihome.diary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.Diary;

/**
 * Servlet implementation class DiaryDeleteServlet
 */
@WebServlet("/diary/diaryDelete")
public class DiaryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Diary d=new Diary();
		int diaryNo=Integer.parseInt(request.getParameter("diary_no"));
		System.out.println(diaryNo);
		String id=request.getParameter("loginMemberId");
		d.setDiaryNo(diaryNo);
		d.setWriter(id);
		
		int result=new DiaryService().deleteDiary(d);
		
		if(result>0) {
			request.getRequestDispatcher("/page/minihomeRightPageToDiary.do").forward(request, response);
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
