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
 * Servlet implementation class DiaryUpdateServlet
 */
@WebServlet("/diary/diaryUpdate")
public class DiaryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Diary d=new Diary();	
		int diaryNo=Integer.parseInt(request.getParameter("diary_no"));
		System.out.println("diaryNo "+diaryNo);
		d.setDiaryNo(diaryNo);
		int folder=Integer.parseInt(request.getParameter("diary_folder"));
		System.out.println("folder "+folder);
				
		String content=request.getParameter("diary_content_input");
		String msg="";
		if(content!=null) {
			d.setContent(content);
		}else {
			/////////////////////////////////////////////
			msg="내용을 입력하세요.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
			///////////////////////////////////////////////
		}		
		
		int result=new DiaryService().updateDiary(d);		
		
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
