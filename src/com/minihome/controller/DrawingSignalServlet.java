package com.minihome.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.minihome.model.service.MinihomeService;

@WebServlet("/ajax/drawingSignal.do")
public class DrawingSignalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MinihomeService service=new MinihomeService();
       
    public DrawingSignalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		JSONObject jo=new JSONObject();
		
		String hostMemberId=request.getParameter("hostMemberId");
		String colorStr=request.getParameter("colorStr");
		if(colorStr!=null) {
			String[] colorArr=new String[14];
			colorArr=colorStr.split("&");
			int result=service.updateColorStr(hostMemberId,colorArr);
		}
		
		colorStr=service.getColorStr(hostMemberId);
		
		jo.put("colorStr",colorStr);
		
		response.getWriter().print(jo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
