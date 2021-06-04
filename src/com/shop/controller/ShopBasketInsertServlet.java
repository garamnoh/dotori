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
@WebServlet("/shop/shopBasketInsert.do")
public class ShopBasketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopBasketInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//List<Integer> itemNums=new ArrayList();
		//itemNums.add(Integer.parseInt(request.getParameter("itemNums")));
		response.setContentType("text/html;charset=utf-8");
		List<String> itemNums=new ArrayList();
		String temp1=request.getParameter("itemNums");  
		String[] temp2=temp1.split(",");
		
		for(int i=0;i<temp2.length;i++) {
			itemNums.add((temp2[i]));
			
		}
		
		String type=request.getParameter("type");
		String id =request.getParameter("memberId");
		
		int result =new ShopService().insertShoppingList(id,itemNums,type);
		
		request.setAttribute("result", result); //data
		request.setAttribute("type", type);
		System.out.println(id);
		
		//result 따라 message 창 띄우기 
		request.getRequestDispatcher("/shop/minimiTable").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
