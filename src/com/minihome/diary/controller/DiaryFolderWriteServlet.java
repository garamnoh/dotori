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
public class DiaryFolderWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryFolderWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String addFolderName=request.getParameter("addFolderName");
		String folderShareLevel=request.getParameter("folderShareLevel");
		String MemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");
		String shareMember="";
		int result=0, check=0, folderNo=0;
		
		if(folderShareLevel.equals("friends")) {
			shareMember=request.getParameter("shareMember");
			String[] shareMembers=shareMember.split(",");
			for(int i=0; i<shareMembers.length; i++) {
				check=new DiaryService().insertDiaryFolder(MemberId, addFolderName, folderShareLevel);
				folderNo=new DiaryService().selectDiaryShareFolder(addFolderName);
				if(check>0) {
					result=new DiaryService().insertShareDiaryFolder(folderNo, shareMembers[i]);					
				}
			}
		}else {
			result=new DiaryService().insertDiaryFolder(MemberId, addFolderName, folderShareLevel);
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
