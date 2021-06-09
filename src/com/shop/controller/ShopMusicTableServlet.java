package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;
import com.shop.model.vo.Music;
import com.shop.model.vo.MusicLike;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopMusicTableServlet
 */
@WebServlet("/shop/musicTable")
public class ShopMusicTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopMusicTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Music> list=new ShopService().musicList();
		String result=(String)request.getAttribute("result");
		
		//Music m= new Music();
		System.out.println(list);
		System.out.println();
		String memberId=((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		request.setAttribute("musicList", list); //data
		request.setAttribute("type", "music");
		request.setAttribute("memberId", memberId); 
		request.setAttribute("result", result); 
		
		List<MusicLike> cheartList=new ShopService().cSearchHeartList();
		request.setAttribute("cheartList", cheartList);
		
		List<Integer> myHeartItemList=new ShopService().cMyHeartItemNoList(memberId);
		request.setAttribute("myHeartItemList", myHeartItemList); 
		
		request.getRequestDispatcher("/views/shop/shopMusic.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
