package com.minihome.album.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.album.model.service.AlbumService;

@WebServlet("/page/minihomeLeftPageToAlbum.do")
public class MinihomeLeftPageToAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlbumService albumService=new AlbumService();
       
    public MinihomeLeftPageToAlbumServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String hostMemberId=request.getParameter("hostMemberId");
		String addFolderTitle=request.getParameter("addFolderTitle");
		String deleteFolderTarget=request.getParameter("deleteFolderTarget");
		
		if(addFolderTitle!=null) {
			int addFolderResult=albumService.addFolder(hostMemberId,addFolderTitle);
		}
		
		if(deleteFolderTarget!=null) {
			int deleteFolderResult=albumService.deleteFolder(hostMemberId,deleteFolderTarget);
		}
		
		List<String> folderList=albumService.getMyFolders(hostMemberId);
		
		if(folderList.contains("기본폴더")) {
			folderList.remove(folderList.indexOf("기본폴더"));
			folderList.add(folderList.size(),"기본폴더");
		}else {
			int addDefaultFolderResult=albumService.addFolder(hostMemberId,"기본폴더");
			folderList.add(folderList.size(),"기본폴더");
		}
		
		request.setAttribute("folderList",folderList);
		
		request.getRequestDispatcher("/views/minihome/leftpage_album.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
