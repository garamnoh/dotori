package com.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.shop.service.ShopService;

/**
 * Servlet implementation class ShopAHeartCountAjaxServlet
 */
@WebServlet("/ajax/aHeartCount")
public class ShopHeartCountAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopHeartCountAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String type =request.getParameter("type");
		String id=request.getParameter("memberId");
		int itemNo=(Integer.parseInt(request.getParameter("itemNo")));
		
		
		//조회문
		int aHeartResult =0;
		int bHeartResult =0;
		int cHeartResult=0;
		if(type.equals("minimi")) {
			new ShopService().aHeartInsert(id,itemNo);
			aHeartResult=new ShopService().aHeartCount(itemNo);
		}else if(type.equals("skin")){
			new ShopService().bHeartInsert(id,itemNo);
			bHeartResult=new ShopService().bHeartCount(itemNo);
		}else if(type.equals("music")){
			new ShopService().cHeartInsert(id,itemNo);
			cHeartResult=new ShopService().cHeartCount(itemNo);
		}
		JSONObject json=new JSONObject();
		json.put("aHeartResult", aHeartResult);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(json,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
