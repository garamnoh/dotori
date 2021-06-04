package com.minihome.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.model.service.MinihomeService;
import com.shop.model.vo.Skin;

@WebServlet("/page/minihomeRightPageToSettings.do")
public class MinihomeRightPageToSettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MinihomeService minihomeService=new MinihomeService();
       
    public MinihomeRightPageToSettingsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String hostMemberId=request.getParameter("hostMemberId");
		
		List<Skin> skinList=minihomeService.getMySkins(hostMemberId);
		
		request.setAttribute("skinList",skinList);
		
		request.getRequestDispatcher("/views/minihome/rightpage_settings.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
