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

@WebServlet("/page/minihomeLeftPageToDiary.do")
public class MinihomeLeftPageToDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MinihomeLeftPageToDiaryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		List<DiaryFolder> list=new DiaryService().selectFolderList();
		
		request.setAttribute("list", list);		
		
		request.getRequestDispatcher("/views/minihome/leftpage_diary.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
