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
		String folder=request.getParameter("diary_folder");
		//System.out.println(folder); //이건 잘 찍힘		
		switch(folder){
			case "전체공개" : d.setFolderNo(1); break;
			case "일촌공개" : d.setFolderNo(2); break;
			case "비공개" : d.setFolderNo(3); break;
		}		
		String content=request.getParameter("diary_content_input");
		System.out.println("content : "+content);
		
		if(content!=null) {
			d.setContent(content);
		}else {
			/////////////////////////////////////////////			
			request.setAttribute("msg", "내용을 입력하세요.");
			request.setAttribute("loc", "/views/minihome/minihome.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
			///////////////////////////////////////////////
		}		
		
		int result=new DiaryService().insertDiary(d);		
		
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
