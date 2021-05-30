package com.minihome.jukebox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.jukebox.model.service.JukeboxService;

@WebServlet("/page/minihomeLeftPageToJukebox.do")
public class MinihomeLeftPageToJukeboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JukeboxService jukeboxService=new JukeboxService();
      
    public MinihomeLeftPageToJukeboxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String hostMemberId=request.getParameter("hostMemberId");
		List<String> albumList=jukeboxService.getMyAlbums(hostMemberId);
		albumList.add(0,"내 모든 음악");
		if(albumList.contains("배경음악")) {
			albumList.remove(albumList.indexOf("배경음악"));
			albumList.add(0,"배경음악");
		}
		
		request.setAttribute("albumList",albumList);
		request.getRequestDispatcher("/views/minihome/leftpage_jukebox.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
