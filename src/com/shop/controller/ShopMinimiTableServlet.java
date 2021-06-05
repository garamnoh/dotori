package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;
import com.shop.model.vo.Minimi;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopMinimiTableServlet
 */
@WebServlet("/shop/minimiTable")
public class ShopMinimiTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopMinimiTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		List<Minimi> list=new ShopService().minimiList();
		Minimi mini= new Minimi();
		String memberId=((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		String result=(String)request.getAttribute("result");
		
		request.setAttribute("minimiList", list); //data
		request.setAttribute("type", "mini"); 
		request.setAttribute("memberId", memberId);
		request.setAttribute("result",result);
		
		request.getRequestDispatcher("/views/shop/shopMinimi.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
