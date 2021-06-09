package com.minihome.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.album.model.vo.Album;
import com.minihome.model.service.MinihomeService;
import com.minihome.model.vo.LatestDiaryInfo;

@WebServlet("/page/minihomeRightPageToHome.do")
public class MinihomeRightPageToHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MinihomeService minihomeService=new MinihomeService();
       
    public MinihomeRightPageToHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String hostMemberId=request.getParameter("hostMemberId");
		
		List<Album> latestAlbumList=minihomeService.getLatestAlbum(hostMemberId);
		List<LatestDiaryInfo> latestDiaryList=minihomeService.getLatestDiary(hostMemberId);
		
		request.setAttribute("latestAlbumList",latestAlbumList);
		request.setAttribute("latestDiaryList",latestDiaryList);
		
		request.getRequestDispatcher("/views/minihome/rightpage_home.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
