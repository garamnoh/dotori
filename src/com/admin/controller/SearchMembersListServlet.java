package com.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class SearchMembersListServlet
 */
@WebServlet("/admin/searchMembersList")
public class SearchMembersListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMembersListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		System.out.println("servlet : "+searchType);
		
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) {
			currentPage = 1;
		}
		
		int linePerPage;
		try {
			linePerPage = Integer.parseInt(request.getParameter("linePerPage"));
		} catch(NumberFormatException e) {
			linePerPage = 10;
		}
		
		int totalData = new AdminService().searchMemberCount(searchType, searchKeyword);
		int totalPage = (int)Math.ceil((double)totalData / linePerPage);
		
		int pageBarSize = 5;
		
		int pageStartFrom = ((currentPage - 1) / pageBarSize) + 1;
		int pageEndTo = pageStartFrom + pageBarSize -1;
		
		String pageBar = "";
		
		if(pageStartFrom == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a id='" + (pageStartFrom - 1) + "'>[이전]</a>";
		}
		
		while(!(pageStartFrom > pageEndTo || pageStartFrom > totalPage)) {
			if(currentPage == pageStartFrom) {
				
				pageBar += "<span>" + pageStartFrom + "</span>";
				
			} else {
				
				pageBar += "<a id='" + pageStartFrom + "'>" + pageStartFrom + "</a>";
				
			}
			pageStartFrom++; // pageStart : 6, 11, 16, 21
		}
		
		if(pageStartFrom > totalPage) {
			
			pageBar += "<span>[다음]</span>";
			
		} else {
			
			pageBar += "<a id='" + pageStartFrom + "'>[다음]</a>";
			
		}
		
		ArrayList<Member> membersList = new AdminService().searchMembersList(searchType, searchKeyword, currentPage, linePerPage);
		
		/*
		 * for(Member member : membersList) { try {
		 * member.setPhone(AESEncrypt.decrypt(member.getPhone())); } catch(Exception e)
		 * { e.printStackTrace(); } }
		 */
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("membersList", membersList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchKeyword", searchKeyword);
		
		request.getRequestDispatcher("/views/admin/submitContainer/section_admin_searchList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
