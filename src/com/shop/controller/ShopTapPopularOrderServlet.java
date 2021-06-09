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
 * Servlet implementation class ShopTapPopularOrderServlet
 */
@WebServlet("/ajax/shopPopularOrder")
public class ShopTapPopularOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopTapPopularOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type =request.getParameter("type");
		//현재 내가 인기순을 정렬할 카테고리가 미니미인가 / 스킨인가 / 뮤직인가
		String view="";
		if(type.equals("minimi")) {
			List<Minimi> minimiPopularOrder= new ShopService().ashopPopularOrder();
			request.setAttribute("minimiList", minimiPopularOrder);
			view="/views/shop/shopMinimi.jsp";
		}else if(type.equals("skin")) {
			List<Skin> skinPopularOrder= new ShopService().bshopPopularOrder();
			request.setAttribute("skinList", skinPopularOrder);
			view="/views/shop/shopSkin.jsp";
		}else if(type.equals("music")) {
			List<Music> musicPopularOrder= new ShopService().cshopPopularOrder();
			request.setAttribute("musicList", musicPopularOrder);
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
