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
		
		System.out.println("테스트 "+id);
		System.out.println("테스트 "+type);
		
		int result =new ShopService().insertShoppingList(id,itemNums,type);
		
		request.setAttribute("result", result); //data
		request.setAttribute("type", type);
		
		//result 따라 message 창 띄우기  왜안돼지.ㅎ.ㅎ.ㅎ.ㅎ
		
		String view="";
		if(result>0) {
			//request.setAttribute("msg2", "장바구니에 담기 성공");
			
			if(type.equals("minimi")) {
				//request.setAttribute("loc", "/shop/minimiTable");
				//request.setAttribute("loc", "/page/shopMinimi.do");
				//request.setAttribute("loc", "/views/main/main.jsp");
				//request.setAttribute("loc", "/views/shop/shopMinimi.jsp");
				request.setAttribute("result","장바구니에 담겼습니다:)");
				view="/shop/minimiTable";
			}else if(type.equals("skin")) {
				//request.setAttribute("loc", "/shop/skinTable");
				//request.setAttribute("loc", "/page/shopSkin.do");
				request.setAttribute("result","장바구니에 담겼습니다:)");
				view="/shop/skinTable";
			}else if(type.equals("music")) {
				//request.setAttribute("loc", "/shop/musicTable");
				//request.setAttribute("loc", "/page/shopMusic.do");
				request.setAttribute("result","장바구니에 담겼습니다:)");
				view="/shop/musicTable";
			}
			
		}else {
			//request.setAttribute("msg2", "장바구니에 담기 실패 관리자에게 문의해주세요:(");
			
			if(type.equals("minimi")) {
				view="/views/shop/shopMinimi.jsp";
			}else if(type.equals("skin")) {
				view="/views/shop/shopSkin.jsp";
			}else if(type.equals("music")) {
				view="/views/shop/shopMusic.jsp";
			}
		}
		request.getRequestDispatcher(view).forward(request, response);
	
		
		//request.getRequestDispatcher("/shop/minimiTable").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
