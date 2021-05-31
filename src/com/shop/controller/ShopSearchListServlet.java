package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.vo.Skin;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopSearchListServlet
 */
@WebServlet("/ajax/shopSearch.do")
public class ShopSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String keyword=request.getParameter("keyword");
		
		List<String> list=new ShopService().searchTitle(1, 50, "title", keyword);
		
		String csv="";
		for(int i=0;i<list.size();i++) {
			if(i!=0) csv+=",";
			csv+=list.get(i);
		}
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(csv); //csv가 jsp의 success로 보내줌
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
