package com.friend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friend.model.service.FriendService;
import com.friend.model.vo.Friend;
import com.friend.model.vo.SearchF;
import com.member.model.vo.Member;

/**
 * Servlet implementation class SearchFriendServlet
 */
@WebServlet("/friends/searchSomeone")
public class SearchSomeoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSomeoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchKeyword = request.getParameter("searchKeyword");
		String myId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
		ArrayList<SearchF> resultList = new FriendService().searchList(myId, searchKeyword);
		
		for(SearchF s : resultList) System.out.println(s);
		
		request.setAttribute("resultList", resultList);
		request.getRequestDispatcher("/views/friends/sub/searchSomeone.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
