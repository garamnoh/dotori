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
		System.out.println(list);
		System.out.println();
		Member m =new Member(); //장바구니에 memberId를 넣어줘서 구별
		
		request.setAttribute("minimiList", list); //data
		request.setAttribute("type", "mini"); 
		request.setAttribute("memberId", m.getMemberId());
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
