package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopBasketDeleteServlet
 */
@WebServlet("/ajax/deleteInBasket")
public class ShopBasketDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopBasketDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		String id=m.getMemberId();
		
		List<String> aitemNo=new ArrayList();
		String temp1=request.getParameter("aitemNo");  
		String[] temp2=temp1.split(",");
		for(int i=0;i<temp2.length;i++) {
			aitemNo.add((temp2[i]));
		}
		List<String> bitemNo=new ArrayList();
		String temp3=request.getParameter("bitemNo");  
		String[] temp4=temp3.split(",");
		for(int i=0;i<temp4.length;i++) {
			bitemNo.add((temp4[i]));
		}
		List<String> citemNo=new ArrayList();
		String temp5=request.getParameter("citemNo");  
		String[] temp6=temp5.split(",");
		for(int i=0;i<temp6.length;i++) {
			citemNo.add((temp6[i]));
		}
		// 주의 구입 안하고 그냥 장바구니 목록에서 삭제 시임
		int aResultDelete =new ShopService().aDeleteInShoppingList(id,aitemNo);
		int bResultDelete =new ShopService().bDeleteInShoppingList(id,bitemNo);
		int cResultDelete =new ShopService().cDeleteInShoppingList(id,citemNo);
		
		request.getRequestDispatcher("/shop/shopBasketSearch.do").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
