package com.minihome.diary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.DiaryComment;

/**
 * Servlet implementation class DiaryCommentWriteServlet
 */
@WebServlet("/diary/diaryCommentWrite")
public class DiaryCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DiaryComment dc=new DiaryComment();
		dc.setCommentLevel(Integer.parseInt(request.getParameter("comment_level")));
		dc.setCommentWriter(request.getParameter("loginMemberId"));
		dc.setDiaryRef(Integer.parseInt(request.getParameter("diary_no")));
		dc.setDiaryCommentRef(Integer.parseInt(request.getParameter("diary_comment_ref")));			
		String comment=request.getParameter("diary_comment");		
		
		String msg="";
		if(comment!=null) {
			dc.setCommentContent(comment);
		}else {
			/////////////////////////////////////////////
			msg="내용을 입력하세요.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
			///////////////////////////////////////////////
		}
		
		int result=new DiaryService().insertComment(dc);		
		
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
