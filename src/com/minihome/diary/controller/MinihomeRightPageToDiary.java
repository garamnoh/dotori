package com.minihome.diary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.Diary;

@WebServlet("/page/minihomeRightPageToDiary.do")
public class MinihomeRightPageToDiary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MinihomeRightPageToDiary() {
        super();
    }

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
