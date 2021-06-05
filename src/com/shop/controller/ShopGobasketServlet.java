package com.shop.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.vo.ShoppingList;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopGobasketServlet
 */
@WebServlet("/shop/shopBasketSearch.do")
public class ShopGobasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopGobasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		//질문 ARR로 넘어왔는데 그럼 ARR로 맞춰줘야?
		//int itemNo=Integer.parseInt(request.getParameter("itemNo"));
		//itemNo.add(Integer.parseInt(request.getParameter("itemNo").split(",",itemNo.size()));
		
		//------여기서부터 시작
		//List<ShoppingList> list =new ShopService().shoppingList(itemNums,type);
		HashMap<String,List> map1 =new ShopService().shoppingList();
		
		request.setAttribute("inBasket", map); //data
		//request.setAttribute("type", type); map으로 분할할꺼임
		
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
