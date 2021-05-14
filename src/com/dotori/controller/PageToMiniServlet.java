package com.dotori.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PageToMiniServlet
 */
@WebServlet("/pageToMini.do")
public class PageToMiniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PageToMiniServlet() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageType","minihome");
		request.getRequestDispatcher("/views/main.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
