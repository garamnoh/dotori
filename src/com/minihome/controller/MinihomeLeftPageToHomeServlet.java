package com.minihome.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.model.service.MinihomeService;
import com.minihome.model.vo.Minihome;
import com.minihome.model.vo.ProfileImg;
import com.shop.model.vo.Skin;

@WebServlet("/page/minihomeLeftPageToHome.do")
public class MinihomeLeftPageToHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MinihomeService minihomeService=new MinihomeService();
       
    public MinihomeLeftPageToHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String hostMemberId=request.getParameter("hostMemberId");
		String changeFeeling=request.getParameter("changeFeeling");
		String profileContent=request.getParameter("profileContent");
		
		if(changeFeeling!=null) {
			int changeFeelingResult=minihomeService.changeFeeling(hostMemberId,changeFeeling);
		}
		
		if(profileContent!=null) {
			int updateProfileContentResult=minihomeService.updateProfileContent(hostMemberId,profileContent);
		}
		
		Minihome minihome=minihomeService.getMinihome(hostMemberId);
		List<Skin> skinList=minihomeService.getMySkins(hostMemberId);
		ProfileImg profileImg=minihomeService.getMyProfileImg(hostMemberId);
		
		request.setAttribute("minihome",minihome);
		request.setAttribute("skinList",skinList);
		request.setAttribute("profileImg",profileImg);
		
		request.getRequestDispatcher("/views/minihome/leftpage_home.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
