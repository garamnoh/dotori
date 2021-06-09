package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;
import com.shop.model.vo.Skin;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopTotalTitleOrderServlet
 */
@WebServlet("/ajax/shopTotalTitleOrder")
public class ShopTotalTitleOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopTotalTitleOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String type =request.getParameter("type");
		//현재 내가 전체를 정렬할 카테고리가 미니미인가 / 스킨인가 / 뮤직인가
		String view="";
		if(type.equals("minimi")) {
			List<Minimi> minimiTotalTitleOrder= new ShopService().ashopTotalOrder();
			request.setAttribute("minimiList", minimiTotalTitleOrder);
			view="/views/shop/shopMinimi.jsp";
		}else if(type.equals("skin")) {
			List<Skin> skinTotalTitleOrder= new ShopService().bshopTotalOrder();
			request.setAttribute("skinList", skinTotalTitleOrder);
			view="/views/shop/shopSkin.jsp";
		}else if(type.equals("music")) {
			List<Music> musicTotalTitleOrder= new ShopService().cshopTotalOrder();
			request.setAttribute("musicList", musicTotalTitleOrder);
			view="/views/shop/shopMusic.jsp";
		}
				
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
