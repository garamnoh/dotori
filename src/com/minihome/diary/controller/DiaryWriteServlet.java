package com.minihome.diary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;
import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.Diary;
import com.minihome.model.service.MinihomeService;
import com.minihome.model.vo.Minihome;

/**
 * Servlet implementation class DiaryWriteServlet
 */
@WebServlet("/diary/diaryWrite")
public class DiaryWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	
	private MemberService memberService=new MemberService();
	private MinihomeService minihomeService=new MinihomeService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		Diary d=new Diary();
		d.setMemberId(request.getParameter("hostMemberId"));
		d.setWriter(request.getParameter("loginMemberId"));		
		int folder=Integer.parseInt(request.getParameter("diary_folder"));
		d.setFolderNo(folder);			
		String content=request.getParameter("diary_content_input");
		
		if(content!=null || content.equals("null")) {
			d.setContent(content);
			int result=new DiaryService().insertDiary(d);		
			if(result>0) {
				request.getRequestDispatcher("/page/minihomeRightPageToDiary.do").forward(request, response);
			}
		}else {
			request.setAttribute("msg", "내용을 입력해주세요");
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
