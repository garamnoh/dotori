package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopBasketUpdateServlet
 */
@WebServlet("/shop/shopBasketUpdate.do")
public class ShopBasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopBasketUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		List<String> itemNums=new ArrayList();
		itemNums.add(request.getParameter("itemNums"));
		String type=request.getParameter("type");
		String id =request.getParameter("memberId");
		
		int result =new ShopService().updateShoppingList(id,itemNums,type);
		
		request.setAttribute("result", result); //data
		request.setAttribute("type", type);
		
		//response.setContentType("text/html;charset=utf-8");
		request.getRequestDispatcher("/views/shop/shopBasket.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
