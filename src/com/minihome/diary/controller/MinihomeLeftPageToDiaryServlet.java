package com.minihome.diary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;
import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.DiaryFolder;
import com.minihome.model.service.MinihomeService;
import com.minihome.model.vo.Minihome;

@WebServlet("/page/minihomeLeftPageToDiary.do")
public class MinihomeLeftPageToDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService memberService=new MemberService();
	private MinihomeService minihomeService=new MinihomeService();
	
    public MinihomeLeftPageToDiaryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String currentPage=request.getParameter("currentPage");
		
		HttpSession session=request.getSession(false);		
		if(session==null||session.getAttribute("loginMember")==null) {
			request.getRequestDispatcher("/views/minihome/errorpage.jsp").forward(request,response);
			return;
		}
		Member loginMember=(Member)session.getAttribute("loginMember");
		String hostMemberId=request.getParameter("hostMemberId");
		Member hostMember=null;
		if(hostMemberId!=null) {
			hostMember=memberService.selectMemberId(hostMemberId);
		}else {
			hostMember=loginMember;
		}
		hostMemberId=hostMember.getMemberId();
		Minihome minihome=minihomeService.getMinihome(hostMemberId);
		
		List<DiaryFolder> list=new DiaryService().selectFolderList(hostMemberId);		
		
		if(list==null) {		
			int result=new DiaryService().insertDiaryFolder(hostMemberId, "전체공개", "PUBLIC");
			result=new DiaryService().insertDiaryFolder(hostMemberId, "일촌공개", "FRIENDS");
			result=new DiaryService().insertDiaryFolder(hostMemberId, "비공개", "PRIVATE");
			list=new DiaryService().selectFolderList(hostMemberId);			
		}	
				
		request.setAttribute("loginMember",loginMember);
		request.setAttribute("hostMember",hostMember);	
		request.setAttribute("list", list);
		request.setAttribute("currentPage",currentPage);
				
		request.getRequestDispatcher("/views/minihome/leftpage_diary.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
