package com.minihome.album.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.album.model.service.AlbumService;

@WebServlet("/page/minihomeRightPageToUpdateAlbum.do")
public class MinihomeRightPageToUpdateAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlbumService albumService=new AlbumService();
       
    public MinihomeRightPageToUpdateAlbumServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String loginMemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");
		
		List<String> folderList=albumService.getMyFolders(hostMemberId);
		
		request.setAttribute("loginMemberId",loginMemberId);
		request.setAttribute("hostMemberId",hostMemberId);
		request.setAttribute("folderList",folderList);
		
		request.getRequestDispatcher("/views/minihome/rightpage_updateAlbum.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
