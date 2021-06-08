package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;
import com.shop.model.vo.Skin;
import com.shop.service.ShopService;

@WebServlet("/shop/shopBasketSearch.do")
public class ShopGobasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ShopGobasketServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		String memberId=m.getMemberId();
		String aCheckStr=request.getParameter("aCheckStr");
		String bCheckStr=request.getParameter("bCheckStr");
		String cCheckStr=request.getParameter("cCheckStr");
		

		List<Minimi> a=new ShopService().shoppingList1(memberId);
		List<Skin> b=new ShopService().shoppingList2(memberId);
		List<Music> c=new ShopService().shoppingList3(memberId);
		
		
		
		request.setAttribute("a", a);
		request.setAttribute("b", b);
		request.setAttribute("c", c);
		
		request.getRequestDispatcher("/views/shop/shopBasket.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
