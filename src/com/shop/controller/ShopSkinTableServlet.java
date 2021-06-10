package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;
import com.shop.model.vo.Skin;
import com.shop.model.vo.SkinLike;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopSkinTableServlet
 */
@WebServlet("/shop/skinTable")
public class ShopSkinTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopSkinTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Skin> list=new ShopService().skinList();
		Skin s= new Skin();
		String memberId=((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		String result=(String)request.getAttribute("result");
		request.setAttribute("skinList", list); //data
		request.setAttribute("type", "skin"); 
		request.setAttribute("memberId", memberId); 
		request.setAttribute("result", result); 
		
		List<SkinLike> bheartList=new ShopService().bSearchHeartList();
		request.setAttribute("bheartList", bheartList);
		
		List<Integer> myHeartItemList=new ShopService().bMyHeartItemNoList(memberId);
		request.setAttribute("myHeartItemList", myHeartItemList); 
		
		request.getRequestDispatcher("/views/shop/shopSkin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
