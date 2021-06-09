package com.friend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friend.model.service.FriendService;
import com.friend.model.vo.FeedDiary;
import com.friend.model.vo.Like;
import com.member.model.vo.Member;

/**
 * Servlet implementation class NewFeedDiaryServlet
 */
@WebServlet("/main/newFeedDiary")
public class NewFeedDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewFeedDiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String myId = (String)((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		ArrayList<Integer> likeList = new FriendService().like(myId);
		ArrayList<Like> count = new FriendService().count();
		
		int linePerPage = 10;
		int page = Integer.parseInt(request.getParameter("page"));
		
		int totalCountD = new FriendService().feedDiaryCount();
		int totalCountA = new FriendService().feedAlbumCount();

		int startNum;
		int endNum;
		
		if(page == 1) {
			startNum = 1;
			endNum = 10;
		} else {
			startNum = ((page-1)*linePerPage) + 1;
			endNum = page * linePerPage;
		}
		
		HashMap<String, Object> newFeed = new FriendService().newFeed(myId, startNum, endNum);

		ArrayList<FeedDiary> feedDiary = (ArrayList<FeedDiary>)newFeed.get("feedDiary");
		for(FeedDiary d: feedDiary) System.out.println(d);
		
		request.setAttribute("count", count);
		request.setAttribute("likeList", likeList);
		request.setAttribute("newFeed", newFeed);
		request.getRequestDispatcher("/views/main/sub/newFeedDiary.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
