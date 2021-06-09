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
import com.friend.model.vo.FeedAlbum;
import com.friend.model.vo.Like;
import com.member.model.vo.Member;

/**
 * Servlet implementation class NewFeedAlbumServlet
 */
@WebServlet("/main/newFeedAlbum")
public class NewFeedAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewFeedAlbumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String myId = (String)((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		ArrayList<Integer> likeListAlbum = new FriendService().likeAlbum(myId);
		ArrayList<Like> countAlbum = new FriendService().countAlbum();
		
		int linePerPage = 10;
		int page = Integer.parseInt(request.getParameter("page"));

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

		ArrayList<FeedAlbum> feedAlbum = (ArrayList<FeedAlbum>)newFeed.get("feedAlbum");
		for(FeedAlbum f: feedAlbum) System.out.println(f);
		
		for(Integer a : likeListAlbum) System.out.println(a);
		
		request.setAttribute("countAlbum", countAlbum);
		request.setAttribute("likeListAlbum", likeListAlbum);
		request.setAttribute("newFeed", newFeed);
		request.getRequestDispatcher("/views/main/sub/newFeedAlbum.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
