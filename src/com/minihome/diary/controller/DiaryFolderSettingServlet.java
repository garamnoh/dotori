package com.minihome.diary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.DiaryFolder;

/**
 * Servlet implementation class DiaryFolderUpdate
 */
@WebServlet("/diary/FolderSetting")
public class DiaryFolderSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryFolderSettingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String loginMemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");
		
		System.out.println(loginMemberId+"+++++"+hostMemberId);
		
		List<DiaryFolder> list=new DiaryService().selectFolderList(hostMemberId);
		List<DiaryFolder> fList=new DiaryService().selectShareFolder(hostMemberId);
		
		request.setAttribute("loginMemberId", loginMemberId);
		request.setAttribute("hostMemberId", hostMemberId);
		request.setAttribute("list", list);
		request.setAttribute("fList", fList);
		
				
		request.getRequestDispatcher("/views/minihome/rightpage_diarySetting.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
