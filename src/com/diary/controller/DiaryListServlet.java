package com.diary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diary.model.service.DiaryService;
import com.diary.model.vo.Diary;

/**
 * Servlet implementation class DiaryListServlet
 */
@WebServlet("/diary/diarySelectList")
public class DiaryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		int numPerpage;
		try { 
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) { 
			cPage=1; 
		}		
		try { 
			numPerpage=Integer.parseInt(request.getParameter("numPerpage")); 
		}catch(NumberFormatException e) { 
			numPerpage=5; 
		}
			
		List<Diary> list=new DiaryService().selectDiaryList();
		int totalData=new DiaryService().selectDiaryCount();		
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		System.out.println(totalData);//18
		int pageBarSize=5;
		int pageNo=((cPage-1)*pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/diary/diarySelectList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/diary/diarySelectList?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href'"+request.getContextPath()
			+"/diary/diarySelectList?cPage="+pageNo+"'>[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);	
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/minihome/rightpage_diary.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
